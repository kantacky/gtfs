import ArgumentParser
import Foundation
import SwiftProtobuf

struct DecodeRT: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "decode-rt",
        abstract: "GTFS Realtime (protobuf) のURLを取得し、JSONに変換して標準出力する。"
    )

    @Argument(help: "GTFS-RT のURL")
    var url: String

    @Flag(name: .shortAndLong, help: "整形して出力する")
    var pretty: Bool = false

    func run() async throws {
        guard let parsedURL = URL(string: url), parsedURL.scheme?.hasPrefix("http") == true else {
            throw DownloadError.invalidURL(url)
        }

        let data = try await Downloader.fetch(url: parsedURL)
        let feed = try TransitRealtime_FeedMessage(serializedBytes: data)

        var options = JSONEncodingOptions()
        options.preserveProtoFieldNames = false
        if pretty {
            options.alwaysPrintEnumsAsInts = false
        }

        let json: String
        if pretty {
            let compact = try feed.jsonString(options: options)
            if let obj = try? JSONSerialization.jsonObject(with: Data(compact.utf8)),
               let pretty = try? JSONSerialization.data(withJSONObject: obj, options: [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]),
               let s = String(data: pretty, encoding: .utf8) {
                json = s
            } else {
                json = compact
            }
        } else {
            json = try feed.jsonString(options: options)
        }
        print(json)
    }
}
