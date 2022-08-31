// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HWSClient",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "HWSClient",
            targets: ["HWSClient"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "HWSClient",
            dependencies: []
        ),
        .testTarget(
            name: "HWSClientTests",
            dependencies: ["HWSClient"],
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)
