//
//  LoadingCardView.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit
import RQShineLabel

class LoadingCardView: UIView {
    var process = ProcessLoadingView(frame: CGRect(x: 0, y: 0, width: 0, height: 200))
    var status: LoadingStatus {
        didSet {
            self.process.status = status
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.titleLabel.text = self.title
                self.titleLabel.shine()
            })
        }
    }
    var titleLabel = RQShineLabel()
    var title = "......"
    var color: UIColor = .cyanColor() {
        didSet {
            process.color = color
        }
    }
    init(title: String) {
        status = .`init`
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        process.translatesAutoresizingMaskIntoConstraints = false
        process.color = color
        addSubview(process)
        NSLayoutConstraint.activate([
            process.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            process.widthAnchor.constraint(equalToConstant: 50),
            process.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.text = self.title
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .clear
        addSubview(titleLabel)
        
        self.title = title
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        self.status = .`init`
        super.init(frame: .zero)
    }
}
