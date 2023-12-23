//
//  NavigatorBar.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit

class NavigatorBar: UIView {
    var iconImageView = UIButton()
    var titleLabel = UILabel()
    init(title: String, imageName: String) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.setImage(UIImage(named: imageName), for: .normal)
        iconImageView.backgroundColor = .clear
        addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 32),
            iconImageView.heightAnchor.constraint(equalToConstant: 32),
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.textColor = .cyanColor()
        titleLabel.text = title
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}
