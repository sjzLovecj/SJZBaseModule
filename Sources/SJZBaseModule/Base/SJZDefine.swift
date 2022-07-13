//
//  SJZDefine.swift
//  SJZBaseModule
//
//  Created by SJZ on 2022/3/23.
//

import Foundation
import UIKit

// MARK: - 获取屏幕宽高
public let screenWidth = UIScreen.main.bounds.width
public let screenHeight = UIScreen.main.bounds.height

// MARK: - 屏幕宽高比例
public let defaultWidth = 375
public let fitWidth = screenWidth / 375

// MARK: - 屏幕像素比例
public let scare = UIScreen.main.scale
public let lineHeight = CGFloat(scare >= 1 ? 1 / scare : 1)

public var isiPhoneX: Bool {
    statusBarHeight > 30
}

// MARK: - 导航栏 和 状态栏
/// 状态栏高度
public var statusBarHeight: CGFloat {
    // iOS13.0之前获取方式
    // UIApplication.shared.statusBarFrame.height
    
    keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
}

/// navBar高度，不包括状态栏
public var navBarHeight: CGFloat {
    UINavigationController().navigationBar.frame.size.height
}

/// 导航栏 和 状态栏高度
/// - 非刘海屏：64
/// - 刘海屏：88
/// - iOS15中状态栏高度不定
public var navAndStatusHeight: CGFloat {
    statusBarHeight + navBarHeight
}

// MARK: - TabBar高度
public var bottomHomeHeight: CGFloat {
    keyWindow?.safeAreaInsets.bottom ?? 0
}

public var tabBarHeight: CGFloat {
    UITabBarController().tabBar.frame.size.height
}

public var tabBarAndHomeHeight: CGFloat {
    bottomHomeHeight + tabBarHeight
}

// MARK: 获取KeyWindow
public var keyWindow: UIWindow? {
    // iOS13.0 之前获取方式
    // UIApplication.shared.keyWindow
    
    let windowScreen = UIApplication.shared.connectedScenes.first as? UIWindowScene
    return windowScreen?.windows.first { key in
        key.isKeyWindow
    }
}

// MARK: - 获取最上层Window
public var currentWindow: UIWindow? {
    // IOS13.0 之前获取的方式
    // UIApplication.shared.windows.last
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    return windowScene?.windows.last
}
