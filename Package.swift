// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DesignSystem",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.15.1"
        ),
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", "0.56.1"..<"0.57.0"),
        .package(name: "DesignTokens", path: "../DesignTokens"),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [.product(name: "DesignTokens", package: "DesignTokens")],
            resources: [],
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: [
                "DesignSystem",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
