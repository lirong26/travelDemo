//
//  HotelViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/26.
//

import Foundation
import UIKit

class HotelViewController: UIViewController {
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func backgroundBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "hotelToPayment") {
            let vc = segue.destination as! PaymentViewController
            vc.name = "Makoto Hotel"
            vc.imageName = "hotel_detail"
            vc.subtotal = "$1,200.00"
            vc.total = "$1,200"
        }
    }
}
