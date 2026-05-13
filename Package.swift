// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConstraintKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ConstraintKit",
            targets: ["ConstraintKit"]),
    ],
    targets: [
        .target(
            name: "ConstraintKit"),
        .testTarget(
            name: "ConstraintKitTests",
            dependencies: ["ConstraintKit"]),
    ]
)
