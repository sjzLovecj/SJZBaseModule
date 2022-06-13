//
//  SJZBundleProtocol.swift
//  IKMBaseModule
//
//  Created by SJZ on 2021/9/24.
//

import Foundation
import UIKit

@objc public protocol SJZBundleProtocol {

}

extension SJZBundleProtocol {
    
    /// 获取当前Bundle，组件中资源所在的Bundle
    /// cocoaPods中，指定资源bundle名称必须和组件名称一直，否则获取不到bundle
    /// 例如，如果组件名称为IKMTJBHomeModule，那么指定资源时，资源bundle名称也必须为IKMTJBHomeModule
    /// s.resource_bundle = {'IKMTJBHomeModule' => ['IKMTJBHomeModule/IKMTJBHomeModule/*.{xcassets}', 'IKMTJBHomeModule/IKMTJBHomeModule/Class/resouce/*.gif']}
    /// - Returns: 当前使用的bundle
    public func currentBundle() -> Bundle {
//        let bundleName = NSStringFromClass(Self.self).components(separatedBy: ".").first
//        let path = Bundle(for: Self.self).path(forResource: bundleName, ofType: "bundle")
//        let bundle = Bundle(path: path ?? "")
        return Bundle(for: Self.self)
    }
    
    public func image(_ named: String) -> UIImage {
        // 获取当前Bundle
        let bundle = currentBundle()
        guard let image = UIImage(named: named, in: bundle, compatibleWith: nil) else {
            if let path = bundle.path(forResource: named, ofType: nil), let image = UIImage(contentsOfFile: path) {
                return image
            }else {
                let image = UIImage(named: named)
                return image ?? UIImage()
            }
        }
        return image
    }
}

