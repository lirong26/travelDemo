//
//  ShareMemoryViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2024/1/9.
//

import Foundation
import UIKit

class ShareMemoryViewController: UIViewController {
    
    weak var homeVC: UIViewController?
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func shareClicked(_ sender: Any) {
        self.dismiss(animated: false)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(identifier: "ShareViewController")
        homeVC?.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func memoryClicked(_ sender: Any) {
        self.dismiss(animated: false)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(identifier: "MemoryViewController")
        homeVC?.navigationController?.pushViewController(viewController, animated: true);
    }
}
