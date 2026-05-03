import ArgumentParser

@main
struct GTFSUtils: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "gtfs-utils",
        abstract: "GTFS / GTFS-JP まわりのユーティリティ集",
        subcommands: []
    )
}
