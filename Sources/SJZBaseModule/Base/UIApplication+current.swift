//
//  File.swift
//  
//
//  Created by SJZ on 2022/7/13.
//

import Foundation
import UIKit

extension UIApplication {
    public func currentController() -> UIViewController? {
        if let keyWindow = keyWindow {
            if let rootVC = keyWindow.rootViewController, let nextResponder = rootVC.view.next {
                if let vc = nextResponder as? UIViewController {
                    return topViewController(controller: vc)
                }else {
                    return topViewController(controller: keyWindow.rootViewController)
                }
            }
        }
        
        return nil
    }

    @discardableResult
    public func topViewController(controller: UIViewController?) -> UIViewController? {
        if let tabVC = controller as? UITabBarController {
            return topViewController(controller: tabVC.selectedViewController)
        }else if let navVC = controller as? UINavigationController {
            topViewController(controller: navVC.topViewController)
        }else if let presented = controller?.presentedViewController {
            if let _ = presented as? UIAlertController {
                return controller
            }else {
                topViewController(controller: presented)
            }
        }
        
        return controller
    }
}
