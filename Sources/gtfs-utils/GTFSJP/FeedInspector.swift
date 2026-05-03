import Foundation
import ZIPFoundation

struct FeedInspection {
    var files: Set<String>
    var headers: [String: Set<String>]
}

enum InspectError: Error, CustomStringConvertible {
    case notAZip
    case missingFeedInfo

    var description: String {
        switch self {
        case .notAZip: return "ZIPアーカイブとして読めません"
        case .missingFeedInfo: return "feed_info.txt がZIP内に見つかりません"
        }
    }
}

private struct EarlyExit: Error {}

struct FeedInspector {
    /// 関心のあるファイルのヘッダ行（カラム名集合）を抽出する。
    /// `interestedFiles` に含まれないエントリは存在チェックのみ行う。
    static func inspect(zipData: Data, interestedFiles: Set<String>) throws -> FeedInspection {
        let archive: Archive
        do {
            archive = try Archive(data: zipData, accessMode: .read)
        } catch {
            throw InspectError.notAZip
        }

        var files: Set<String> = []
        var headers: [String: Set<String>] = [:]

        for entry in archive {
            // ZIP内のパスはサブディレクトリ付きの場合があるので末尾要素のみ採用。
            let basename = (entry.path as NSString).lastPathComponent.lowercased()
            files.insert(basename)

            if interestedFiles.contains(basename) {
                if let header = try? readFirstLine(of: entry, in: archive) {
                    headers[basename] = parseCSVHeader(header)
                }
            }
        }

        guard files.contains("feed_info.txt") else {
            throw InspectError.missingFeedInfo
        }

        return FeedInspection(files: files, headers: headers)
    }

    /// エントリの先頭1行（改行まで）だけを取り出す。最大16KiBまで読んで打ち切る。
    private static func readFirstLine(of entry: Entry, in archive: Archive) throws -> String? {
        var buffer = Data()
        let maxBytes = 16 * 1024
        do {
            _ = try archive.extract(entry, bufferSize: 4096, skipCRC32: true) { chunk in
                buffer.append(chunk)
                if buffer.count >= maxBytes || buffer.contains(0x0A) /* LF */ {
                    throw EarlyExit()
                }
            }
        } catch is EarlyExit {
            // 想定通り
        }

        // BOM除去
        var bytes = buffer
        if bytes.starts(with: [0xEF, 0xBB, 0xBF]) {
            bytes.removeFirst(3)
        }
        // 最初の改行までに切り詰め
        if let lf = bytes.firstIndex(of: 0x0A) {
            bytes = bytes.prefix(upTo: lf)
            if bytes.last == 0x0D { bytes = bytes.dropLast() }
        }
        return String(data: bytes, encoding: .utf8)
    }

    private static func parseCSVHeader(_ line: String) -> Set<String> {
        // GTFSのヘッダ行は単純なカンマ区切り（クォートを含まない実態）。
        // 念のためダブルクォートを剥がし、前後空白をトリムする。
        line.split(separator: ",", omittingEmptySubsequences: false).reduce(into: Set<String>()) { acc, raw in
            var col = raw.trimmingCharacters(in: .whitespaces)
            if col.hasPrefix("\""), col.hasSuffix("\""), col.count >= 2 {
                col = String(col.dropFirst().dropLast())
            }
            if !col.isEmpty {
                acc.insert(col)
            }
        }
    }
}
