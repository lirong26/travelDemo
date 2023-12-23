//
//  ProfileTwoViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/22.
//

import Foundation
import UIKit

class ProfileTwoViewController: UIViewController {
    
    @IBAction func menuAction(_ sender: Any) {
        
    }
    var header: RoundHeaderView! = RoundHeaderView(title: "Profile 2/2")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(header)
        header.frame = CGRect(x: -150, y: -150 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), width: UIScreen.main.bounds.width + 300, height: 200)
        header.alpha = 0.8
        UIView.animate(withDuration: 1) {
            self.header.alpha = 1
            self.header.frame = CGRect(x: -150, y: -100 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), width: UIScreen.main.bounds.width + 300, height: 200)
        }

    }
}
