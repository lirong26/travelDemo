//
//  CommonCardView.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit

class CommonCardView: UIView {
    var iconImageView = UIImageView()
    var titleLabel = UILabel()
    init(title: String, imageName: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(named: imageName)
        iconImageView.backgroundColor = .clear
        addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        titleLabel.textColor = .black
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
