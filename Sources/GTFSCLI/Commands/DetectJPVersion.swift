import ArgumentParser
import Foundation

struct DetectJPVersion: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "detect-jp-version",
        abstract: "GTFS-JPのZIP配布URLから仕様プロファイル版（第1〜4版）を判定する。"
    )

    @Argument(help: "GTFS-JP ZIP のURL")
    var url: String

    @Flag(name: .shortAndLong, help: "判定根拠も出力する")
    var verbose: Bool = false

    func run() async throws {
        guard let parsedURL = URL(string: url), parsedURL.scheme?.hasPrefix("http") == true else {
            throw DownloadError.invalidURL(url)
        }

        let data = try await Downloader.fetch(url: parsedURL)
        let inspection = try FeedInspector.inspect(
            zipData: data,
            interestedFiles: GTFSJPDetector.interestedFiles
        )
        let (version, reasons) = GTFSJPDetector.detect(inspection)

        print(version.label)
        if verbose {
            for r in reasons {
                FileHandle.standardError.write(Data("  - \(r)\n".utf8))
            }
        }

        switch version {
        case .unknown:
            throw ExitCode(2)
        default:
            break
        }
    }
}
