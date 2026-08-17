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
        .library(name: "TransitAppDependency", targets: ["TransitAppDependency"]),
        .library(name: "TransitAppFeature", targets: ["TransitAppFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.8.2"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.38.1"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.26.1"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.15.0"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.19"),
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
        .target(
            name: "TransitApp",
            dependencies: ["TransitAppFeature"]
        ),
        .target(
            name: "TransitAppDependency",
            dependencies: [
                "GTFSRealtime",
                "GTFSSchedule",
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "DependenciesMacros", package: "swift-dependencies"),
            ]
        ),
        .target(
            name: "TransitAppFeature",
            dependencies: [
                "TransitAppDependency",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Dependencies", package: "swift-dependencies"),
            ]
        ),
        .target(name: "Utility"),
    ],
    swiftLanguageModes: [.v6]
)
