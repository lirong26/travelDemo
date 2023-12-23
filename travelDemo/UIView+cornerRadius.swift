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
    
}
