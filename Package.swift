// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
  name: "AppSceneStorage",
  platforms: [.iOS(.v13), .macOS(.v10_15), .watchOS(.v7), .visionOS(.v1)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "AppSceneStorage",
      targets: ["AppSceneStorage"])
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "601.0.0-latest")
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "AppSceneStorage"),
    .target(
      name: "AppSceneStorageMacro",
      dependencies: [
        "AppSceneStorageMacroPlugin",
        "AppSceneStorage",
      ]
    ),
    .macro(
      name: "AppSceneStorageMacroPlugin",
      dependencies: [
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftDiagnostics", package: "swift-syntax"),
      ]
    ),
    .executableTarget(
      name: "AppSceneStorageMacroClient",
      dependencies: [
        "AppSceneStorageMacro"
      ]
    ),
    .testTarget(
      name: "AppSceneStorageTests",
      dependencies: ["AppSceneStorage"]
    ),
    .testTarget(
      name: "AppSceneStorageMacroTests",
      dependencies: [
        "AppSceneStorageMacroPlugin",
        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
      ]
    ),
  ]
)
