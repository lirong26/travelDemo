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
        backgroundColor = UIColor(red: 233 / 255.0, green: 65 / 255.0, blue: 136 / 255.0, alpha: 1.0)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.titleLabel?.tintColor = .white
    }
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}
