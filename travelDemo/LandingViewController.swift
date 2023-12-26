//
//  LandingViewController.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit
import SwiftyGif

class LandingViewController: UIViewController, SwiftyGifDelegate {
    @IBOutlet
    var imageView: UIImageView!
    
    @IBOutlet
    var btn: CommonButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo:view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo:view.heightAnchor),
            imageView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 200),
            imageView.trailingAnchor.constraint(equalTo:view.trailingAnchor)
        ])
        imageView.clipsToBounds = false
        do {
            let gif = try UIImage(gifName: "welcome")
            imageView.setGifImage(gif, manager: SwiftyGifManager.defaultManager, loopCount: 1)
            imageView.startAnimatingGif()
            imageView.delegate = self
        } catch {
            
        }

        btn.setImage(UIImage(named: "plain"), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("continue", for: .normal)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        btn.alpha = 0
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0) - 50),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btn.heightAnchor.constraint(equalToConstant: 50),
            btn.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    func gifDidStop(sender: UIImageView) {
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 0
            self.btn.alpha = 1
        } completion: { _ in
            SwiftyGifManager.defaultManager.deleteImageView(sender)
        }
    }
}
