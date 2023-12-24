//
//  UIView+cornerRadius.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/21.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var layerColor: UIColor {
        get {
            return UIColor(cgColor: layer.backgroundColor ?? CGColor(red: 0, green: 0, blue: 0, alpha: 0))
        }
        set {
            layer.backgroundColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor ?? CGColor(red: 0, green: 0, blue: 0, alpha: 0))
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
}

//extension UILabel {
//    @IBInspectable var shadowColor: UIColor {
//        get {
//            return UIColor(cgColor: layer.shadowColor ?? CGColor(red: 0, green: 0, blue: 0, alpha: 0))
//        }
//        set {
//            layer.shadowColor = newValue.cgColor
//        }
//    }
//}
