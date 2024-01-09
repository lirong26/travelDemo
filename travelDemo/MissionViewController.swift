//
//  MissionViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2024/1/9.
//

import Foundation
import UIKit

class MissionViewController: UIViewController {
    
    weak var homeVC: UIViewController?
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
