// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "fastmenu",
    platforms: [
           .macOS(.v10_15)
       ],
    
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.4.0"),
        .package(url: "https://github.com/apparata/ConsoleKit.git", from: "0.2.0")
    ],
 
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on. 
        .executableTarget(
            name: "fastmenu",
            dependencies: [
                .product(name: "ConsoleKit", package: "ConsoleKit"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "fastmenuTests",
            dependencies: ["fastmenu"]),
    ]
)
