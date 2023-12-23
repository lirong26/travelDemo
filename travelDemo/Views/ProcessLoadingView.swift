//
//  ProcessLoadingView.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit

enum LoadingStatus {
    case `init`
    case loading
    case success
}

class ProcessLoadingView: UIView {
    let backView = UIView()
    let processView = UIView()
    let circleView = UIView()
    let loadingView = UIImageView()
    let successView = UIImageView()
    let radius = 25.0
    var color: UIColor = .cyanColor() {
        didSet {
            self.processView.backgroundColor = color
            self.circleView.backgroundColor = color
        }
    }
    var status: LoadingStatus {
        didSet {
            switch status {
            case .`init`:
                return
            case .loading:
                processBottomAnchor.constant = height
                processView.setNeedsUpdateConstraints()
                UIView.animate(withDuration: 1.5) {
                    self.layoutIfNeeded()
                    
                }
                UIView.animate(withDuration: 0.5, delay: 1) {
                    self.circleView.alpha = 1
                    self.successView.alpha = 0
                } completion: { _ in
                    self.status = .success
                }
            case .success:
                UIView.animate(withDuration: 1) {
                    self.loadingView.alpha = 0
                    self.successView.alpha = 1
                }
            }
        }
    }
    
    var processBottomAnchor: NSLayoutConstraint = NSLayoutConstraint()
    var height = 0.0;
    override init(frame: CGRect) {
        status = .`init`
        super.init(frame: frame)
        height = frame.size.height - radius
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .greyColor()
        backView.layer.cornerRadius = 5
        addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            backView.widthAnchor.constraint(equalToConstant: 20)
        ])
        processView.translatesAutoresizingMaskIntoConstraints = false
        processView.backgroundColor = color
        processView.layer.cornerRadius = 5
        addSubview(processView)
        processBottomAnchor = processView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            processView.topAnchor.constraint(equalTo: topAnchor),
            processView.centerXAnchor.constraint(equalTo: centerXAnchor),
            processBottomAnchor,
            processView.widthAnchor.constraint(equalToConstant: 20)
        ])
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.alpha = 0
        circleView.layer.cornerRadius = radius
        circleView.layer.masksToBounds = true
        circleView.backgroundColor = color
        addSubview(circleView)
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: radius * 2),
            circleView.heightAnchor.constraint(equalToConstant: radius * 2),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.image = UIImage(named: "spanner")?.withTintColor(.white)
        circleView.addSubview(loadingView)
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: 20),
            loadingView.heightAnchor.constraint(equalToConstant: 20)
        ])
        addRotation()
        
        successView.translatesAutoresizingMaskIntoConstraints = false
        successView.image = UIImage(named: "right")?.withTintColor(.white)
        circleView.addSubview(successView)
        NSLayoutConstraint.activate([
            successView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            successView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            successView.widthAnchor.constraint(equalToConstant: 20),
            successView.heightAnchor.constraint(equalToConstant: 20)
        ])
        self.layoutIfNeeded()
        
    }
    func addRotation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.duration = 2
        animation.autoreverses = false
        animation.fillMode = .forwards
        animation.repeatCount = .infinity
        loadingView.layer.add(animation, forKey: "rotation")
    }
    required init?(coder: NSCoder) {
        status = .`init`
        super.init(frame: .zero)
    }
}

