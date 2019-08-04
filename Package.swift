// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ShowSomeProgress",
    products: [
        .library(
            name: "ShowSomeProgress",
            targets: ["ShowSomeProgress"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ShowSomeProgress",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "ShowSomeProgressTests",
            dependencies: ["ShowSomeProgress"],
            path: "Tests"
        ),
    ]
)
