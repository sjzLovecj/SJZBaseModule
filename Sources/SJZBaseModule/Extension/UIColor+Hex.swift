//
//  UIFont+Hex.swift
//  SJZBaseModule
//
//  Created by SJZ on 2022/3/23.
//

import UIKit

extension UIColor {

    /// 使用整数值 生成 颜色值，整数值小于 0xFFFFFF
    /// - Parameters:
    ///   - hex: 整数值，最好为十六进制数值（比较直观，例如0xFFFFFF）
    ///   - alpha: 透明度
    convenience public init(hex: Int, alpha: CGFloat = 1.0) {
        if hex > 0xFFFFFF {
            // 如果超出数值，那么将返回白色
            self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: alpha)
        }else {
            let red = Float((hex & 0xFF0000) >> 16) / 255.0
            let green = Float((hex & 0xFF00) >> 8) / 255.0
            let blue = Float((hex & 0xFF)) / 255.0
            self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: alpha)
        }
    }
    
    /// 使用 十六进制字符串 生成 颜色值
    /// - Parameter hexStr: 十六进制字符串（例如"#FFFFFF"）
    convenience public init(hexStr: String) {
        // 替换字符串
        var colorStr = hexStr.replacingOccurrences(of: "#", with: "")
        colorStr = colorStr.replacingOccurrences(of: "0x", with: "")
        colorStr = colorStr.replacingOccurrences(of: "0X", with: "")
        
        if !colorStr.isEmpty, colorStr.count <= 6 {
            // 将字符串转为Int
            let scanner = Scanner(string: colorStr)
            var result: UInt64 = 0
            scanner.scanHexInt64(&result)
            self.init(hex: Int(result))
        }else {
            // 如果超出数值，那么将返回白色
            self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
