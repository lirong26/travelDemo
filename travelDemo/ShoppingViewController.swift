//
//  ShoppingViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2024/1/9.
//

import Foundation
import UIKit

class ShoppingViewController: UIViewController {
    
    weak var homeVC: UIViewController?
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func restaurantClicked(_ sender: Any) {
        self.dismiss(animated: false)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(identifier: "RestaurantViewController")
        homeVC?.navigationController?.pushViewController(viewController, animated: true)
    }
}
