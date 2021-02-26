// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pushy",
    products: [.executable(name: "Pushy", targets: ["Pushy"])],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Files", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1")
    ],
    targets: [
        .target(name: "Pushy", dependencies: ["Files", .product(name: "ArgumentParser", package: "swift-argument-parser")])
    ]
)
