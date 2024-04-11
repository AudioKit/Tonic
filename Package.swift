// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Tonic",
    products: [.library(name: "Tonic", targets: ["Tonic"])],
    targets: [
        .target(name: "Tonic", resources: [.process("Tonic.docc")]),
        .testTarget(name: "TonicTests", dependencies: ["Tonic"]),
    ]
)
