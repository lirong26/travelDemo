//
//  CommonButton.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit

class CommonButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.pinkColor()
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.titleLabel?.tintColor = .white
    }
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}
