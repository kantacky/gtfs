// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GTFS",
    platforms: [.macOS(.v26)],
    products: [
        .executable(name: "GTFSCLI", targets: ["GTFSCLI"])
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
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
