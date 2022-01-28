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
        .package(url: "https://github.com/PSPDFKit/PSPDFKit-SP", from: "11.2.0"),
    ],
    targets: [
        .target(
            name: "_PDFXKitObjC",
            dependencies: [
                .product(name: "PSPDFKit", package: "PSPDFKit-SP")
            ],
            path: "Sources/PDFXKitObjC",
            publicHeadersPath: "Public",
            cSettings: [
                .headerSearchPath("Private"),
                .define("SPM_BUILD")
            ]
        ),
        .target(
            name: "PDFXKit",
            dependencies: ["_PDFXKitObjC"],
            path: "Sources/PDFXKit"),
        .testTarget(
            name: "PDFXKitTests",
            dependencies: ["PDFXKit"],
            path: "Tests")
    ]
)
