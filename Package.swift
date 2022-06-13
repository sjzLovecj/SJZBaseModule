// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SJZBaseModule",
    // 平台支持
    platforms: [.iOS(.v13)],
    // 编译项目后生成，可以是library 或者 executable
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SJZBaseModule",
            targets: ["SJZBaseModule"]),
    ],
    // 依赖库
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    
    // 属于此软件包的目标列表
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SJZBaseModule",
            dependencies: []),
        .testTarget(
            name: "SJZBaseModuleTests",
            dependencies: ["SJZBaseModule"]),
    ],
    
    // 支持Swift的版本
    swiftLanguageVersions: [.v5]
)
