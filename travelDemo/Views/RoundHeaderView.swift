//
//  File.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit

class RoundHeaderView: UIView {
    var backgroundImageView = UIImageView(image: UIImage(named: "circle"))
    var titleLabel = UILabel()
    init(title: String) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.backgroundColor = .clear
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .white
        titleLabel.text = title
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}


