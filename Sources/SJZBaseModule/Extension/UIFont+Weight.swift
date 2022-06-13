//
//  UIFont+Weight.swift
//  SJZBaseModule
//
//  Created by SJZ on 2022/3/23.
//

import Foundation
import UIKit

extension UIFont {
    @discardableResult
    @objc public class func font(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size)
    }
    
    @discardableResult
    @objc public class func medium(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .medium)
    }
    
    @discardableResult
    @objc public class func semibold(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .semibold)
    }
    
    @discardableResult
    @objc public class func bold(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .bold)
    }
    
    @discardableResult
    @objc public class func heavy(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .heavy)
    }
    
    @discardableResult
    @objc public class func black(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .black)
    }
    
    @discardableResult
    @objc public class func light(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .light)
    }
    
    @discardableResult
    @objc public class func thin(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .thin)
    }
}
