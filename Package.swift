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
            targets: ["PDFXKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/PSPDFKit/PSPDFKit-SP", from: "11.2.4"),
    ],
    targets: [
        .target(
            name: "PDFXKitObjC",
            dependencies: [
                .product(name: "PSPDFKit", package: "PSPDFKit-SP")
            ],
            path: "Sources/PDFXKitObjC",
            publicHeadersPath: "Public",
            cSettings: [
                .headerSearchPath("Private")
            ]
        ),
        .target(
            name: "PDFXKit",
            dependencies: ["PDFXKitObjC"],
            path: "Sources/PDFXKit"),
        .testTarget(
            name: "PDFXKitTests",
            dependencies: ["PDFXKit"],
            path: "Tests")
    ]
)
