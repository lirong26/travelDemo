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
    
}
