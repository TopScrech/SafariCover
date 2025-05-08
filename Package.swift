// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SafariCover",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SafariCover",
            targets: ["SafariCover"]),
    ],
    targets: [
        .target(
            name: "SafariCover",
            dependencies: [],
            linkerSettings: [
                .linkedFramework("SafariServices")
            ]
        )
    ]
)
