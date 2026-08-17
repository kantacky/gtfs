// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GTFS",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .visionOS(.v26),
        .watchOS(.v26),
    ],
    products: [
        .executable(name: "GTFSCLI", targets: ["GTFSCLI"]),
        .library(name: "GTFSRealtime", targets: ["GTFSRealtime"]),
        .library(name: "GTFSSchedule", targets: ["GTFSSchedule"]),
        .library(name: "TransitApp", targets: ["TransitApp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.19"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.27.0"),
    ],
    targets: [
        .executableTarget(
            name: "GTFSCLI",
            dependencies: [
                "GTFSJP",
                "GTFSRealtime",
                "Utility",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
            ]
        ),
        .target(
            name: "GTFSJP",
            dependencies: [
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
            ]
        ),
        .target(
            name: "GTFSRealtime",
            plugins: [
                .plugin(name: "SwiftProtobufPlugin", package: "swift-protobuf"),
            ]
        ),
        .target(name: "GTFSSchedule"),
        .target(name: "TransitApp"),
        .target(name: "Utility"),
    ],
    swiftLanguageModes: [.v6]
)
