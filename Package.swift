// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Money",
  products: [
    .library(name: "Money", targets: ["Money"])
  ],
  dependencies: [
    .package(name: "Currency", url: "git@github.com:rzeszot/swift-currency.git", branch: "main")
  ],
  targets: [
    .target(name: "Money", dependencies: ["Currency"]),
    .testTarget(name: "MoneyTests", dependencies: ["Money"])
  ]
)
