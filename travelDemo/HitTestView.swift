//
//  HitTestView.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/22.
//

import Foundation
import UIKit

class HitTestView: UIView {
    override func hitTest(_ point: CGPoint,with event: UIEvent?) -> UIView? {
        if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
               return nil;
        }
        for subview in self.subviews {
            let convertedPoint = subview.convert(point, from: self)
            let hitTestView = subview.hitTest(convertedPoint, with: event)
            if hitTestView != nil {
                return hitTestView
            }
        }
        return nil
    }
}
