// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Tonic",
    products: [.library(name: "Tonic", targets: ["Tonic"])],
    targets: [
        .target(name: "Tonic", swiftSettings: [.unsafeFlags(["-enable-testing", "-g"])]),
        .testTarget(name: "TonicTests", dependencies: ["Tonic"]),
    ]
)
