//
//  GenerateViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/22.
//

import Foundation
import UIKit

class GenerateViewController: UIViewController {
    var header: RoundHeaderView! = RoundHeaderView(title: "Create your Own Tour")
    var blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    var backView = UIView()

    override func viewDidLoad() {
        view.addSubview(header)
        header.frame = CGRect(x: -150, y: -150 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), width: UIScreen.main.bounds.width + 300, height: 200)
        header.alpha = 0.8
        UIView.animate(withDuration: 0.5) {
            self.header.alpha = 1
            self.header.frame = CGRect(x: -150, y: -100 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), width: UIScreen.main.bounds.width + 300, height: 200)
        }
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.layer.cornerRadius = 50
        blurView.layer.masksToBounds = true
        blurView.alpha = 0.8
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 - (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)),
        ])
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backView)
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)),
        ])
        
        addInfo()
        var timeout = 0
        infos.forEach { card in
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(timeout), execute: {
                card.status = .loading
            })
            timeout = timeout + 2
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(timeout + 1), execute: {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(identifier: "HomeViewController")
            self.navigationController?.pushViewController(viewController, animated: true);

        })

    }
    var infos = [LoadingCardView]()
    func addInfo() {
        backView.subviews.forEach { sub in
            sub.removeFromSuperview()
        }
        let title = ["Recommend attractions",
                     "Generate navigation",
                     "Create missons",
                     "Create Map",
                     "Congratulations!"]
        
        var current: UIView?
        for i in 0..<title.count {
            let view1 = LoadingCardView(title: title[i])
            view1.translatesAutoresizingMaskIntoConstraints = false
            view1.layer.zPosition = 10.0 - CGFloat(i)
            backView.addSubview(view1)
            NSLayoutConstraint.activate([
                view1.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
                view1.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
                view1.topAnchor.constraint(equalTo: (current != nil ? current!.bottomAnchor : blurView.topAnchor)),
                view1.heightAnchor.constraint(equalTo: blurView.heightAnchor, multiplier: 0.2),
            ])
            current = view1
            infos.append(view1)
        }
        infos.last?.color = .pinkColor()
        view.bringSubviewToFront(header)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}
