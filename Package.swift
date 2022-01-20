// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "PDFXKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PDFXKit",
            targets: ["PDFXKit", "PDFXKitObjC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/PSPDFKit/PSPDFKit-SP", from: "11.2.0"),
    ],
    targets: [
        .target(
            name: "PDFXKitObjC",
            dependencies: [
                .product(name: "PSPDFKit", package: "PSPDFKit-SP")
            ],
            path: "Sources",
            exclude: ["Swift"],
			publicHeadersPath: ""),
        .target(
            name: "PDFXKit",
            dependencies: ["PDFXKitObjC"],
            path: "Sources/Swift"),
        .testTarget(
            name: "PDFXKitTests",
            dependencies: ["PDFXKit"],
            path: "Tests")
    ]
)
