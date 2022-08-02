// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "Tonic",
    platforms: [ .macOS(.v12), .iOS(.v15)], // Added platforms for building docc documentation to work
    products: [.library(name: "Tonic", targets: ["Tonic"])],
    targets: [
        .target(name: "Tonic", swiftSettings: [.unsafeFlags(["-enable-testing", "-g"])]),
        .testTarget(name: "TonicTests", dependencies: ["Tonic"]),
    ]
)
