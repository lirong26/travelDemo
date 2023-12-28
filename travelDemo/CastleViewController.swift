//
//  CastleViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/28.
//

import Foundation
import UIKit

class CastleViewController: UIViewController {
    
    @IBAction func backgroundClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "castleToPayment") {
            let vc = segue.destination as! PaymentViewController
            vc.name = "Osaka Castle"
            vc.imageName = "castle"
            vc.subtotal = "$20"
            vc.total = "$20"
        }
    }
}
