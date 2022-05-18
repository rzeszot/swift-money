// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Money",
    products: [
        .library(name: "Money", targets: ["Money"]),
    ],
    dependencies: [
        .package(name: "Currency", url: "https://github.com/rzeszot/swift-currency.git", from: "1.0.3"),
    ],
    targets: [
        .target(name: "Money", dependencies: ["Currency"]),
        .testTarget(name: "MoneyTests", dependencies: ["Money"]),
    ]
)
