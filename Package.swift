// swift-tools-version: 5.4

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
