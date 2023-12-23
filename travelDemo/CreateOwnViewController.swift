//
//  CreateOwnViewController.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit

class CreateOwnViewController: UIViewController {
    
    var header: RoundHeaderView! = RoundHeaderView(title: "Create your Own Tour")
    var backgroundImageView: UIImageView! = UIImageView()
    var blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    var topAnchor: NSLayoutConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(header)
        header.frame = CGRect(x: -150, y: -150 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), width: UIScreen.main.bounds.width + 300, height: 200)
        header.alpha = 0.8
        UIView.animate(withDuration: 1) {
            self.header.alpha = 1
            self.header.frame = CGRect(x: -150, y: -100 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), width: UIScreen.main.bounds.width + 300, height: 200)
        }

        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.layer.cornerRadius = 10
        blurView.layer.masksToBounds = true
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100 - (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)),
        ])
        
        addInfo()
        
        let btn = CommonButton(frame: .zero)
        btn.addTarget(self, action: #selector(onclickNext), for: .touchUpInside)
        btn.setTitle("next", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: blurView.bottomAnchor, constant: 20),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btn.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    @objc
    func onclickNext(btn: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController = mainStoryboard.instantiateViewController(identifier: "ProfileOneViewController")
        self.navigationController?.pushViewController(viewController, animated: true);
    }
    func addInfo() {
        blurView.contentView.subviews.forEach { sub in
            sub.removeFromSuperview()
        }
        let title = ["Tell your information", "Generate", "Generate", "Generate", "Generate"]
        let icon = ["person", "person", "person", "person", "person"]
        
        var current: UIView?
        for i in 0..<icon.count {
            let view1 = CommonCardView(title: title[i], imageName: icon[i])
            view1.translatesAutoresizingMaskIntoConstraints = false
            blurView.contentView.addSubview(view1)
            NSLayoutConstraint.activate([
                view1.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
                view1.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
                view1.topAnchor.constraint(equalTo: (current != nil ? current!.bottomAnchor : blurView.topAnchor)),
                view1.heightAnchor.constraint(equalTo: blurView.heightAnchor, multiplier: 0.2),
            ])
            current = view1
            
        }
    }
    
}
