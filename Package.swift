// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "aoc2024",
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "aoc2024",
      resources: [
        .copy("inputs")
      ]),

    .testTarget(
      name: "aoc2024-tests",
      dependencies: ["aoc2024"]
    ),
  ]
)
