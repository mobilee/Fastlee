// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Fastlee",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Fastlee",
            targets: ["Fastlee"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Fastlee",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "FastleeTests",
            dependencies: ["Fastlee"],
            path: "Tests"
        ),
    ]
)
