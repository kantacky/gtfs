import ArgumentParser

@main
struct GTFSCLI: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "gtfs",
        abstract: "GTFS / GTFS-JP まわりのユーティリティ集",
        subcommands: [DetectJPVersion.self, DecodeRT.self]
    )
}
