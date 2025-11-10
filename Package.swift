// swift-tools-version: 6.2.1
import PackageDescription

let package = Package(
    name: "SafariCover",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SafariCover",
            targets: ["SafariCover"]
        )
    ],
    targets: [
        .target(
            name: "SafariCover",
            linkerSettings: [
                .linkedFramework("SafariServices")
            ]
        )
    ]
)
