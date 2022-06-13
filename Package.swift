// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SJZBaseModule",
    // 平台支持
    platforms: [
        .iOS(.v13)
    ],
    
    // 编译项目后生成，可以是library 或者 executable
    products: [
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
        .target(
            name: "SJZBaseModule",
            dependencies: []),
        .testTarget(
            name: "SJZBaseModuleTests",
            dependencies: ["SJZBaseModule"]),
    ],
    
    // 支持Swift的版本
    swiftLanguageVersions: [
        .v5
    ]
)
