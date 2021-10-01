// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StatefulUI",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .watchOS(.v8),
        .tvOS(.v15)
    ],
    products: [
        .library(
            name: "StatefulUI",
            targets: ["StatefulUI"]
        )
    ],
    targets: [
        .target(
            name: "StatefulUI",
            dependencies: []
        ),
        .testTarget(
            name: "StatefulUITests",
            dependencies: ["StatefulUI"]
        )
    ]
)
