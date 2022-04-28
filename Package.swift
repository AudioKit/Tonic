// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tonic",
    products: [.library(name: "Tonic", targets: ["Tonic"])],
    dependencies: [],
    targets: [
        .target(name: "Tonic", dependencies: []),
        .testTarget(name: "TonicTests", dependencies: ["Tonic"]),
    ]
)
