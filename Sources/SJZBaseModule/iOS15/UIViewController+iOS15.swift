//
//  UIViewController+iOS15.swift
//  SJZBaseModule
//
//  Created by SJZ on 2022/4/26.
//

import Foundation
import UIKit

/**
 * 适配iOS15，导航栏模糊效果
 */
public extension UIViewController {
    
    @objc class func initializeChangeMethod() {
        let originalSelector = #selector(UIViewController.viewWillAppear(_:))
        let swizzledSelector = #selector(UIViewController.ikm_viewWillAppear(_:))
        SJZExchangeMethod.exchangeMethod(classType: self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }
    
    static var scrollEdge = "scrollEdgeAppearance"
    @objc var scrollEdge: Bool {
        get {
            // 结束页面时间
            guard let scrollEdge = objc_getAssociatedObject(self, &UIViewController.scrollEdge) as? Bool else {
                return false
            }
            
            return scrollEdge
        }
        set {
            // 保存页面时间
            objc_setAssociatedObject(self, &UIViewController.scrollEdge, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc func ikm_viewWillAppear(_ animated: Bool) {
        self.ikm_viewWillAppear(animated)
        
        // 保存初始化时间
        if !scrollEdge {
            if #available(iOS 15.0, *) {
                //UINavigationBarAppearance属性从iOS13开始
                let navBarAppearance = UINavigationBarAppearance()
                // 背景色
                navBarAppearance.backgroundColor = .white
                // 去掉半透明效果
                navBarAppearance.backgroundEffect = nil
                // 去除导航栏阴影（如果不设置clear，导航栏底下会有一条阴影线）
                navBarAppearance.shadowColor = UIColor.clear
                navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
                navigationController?.navigationBar.standardAppearance = navBarAppearance
            }
        }
    }
}
