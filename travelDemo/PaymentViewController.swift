//
//  PaymentViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/26.
//

import Foundation
import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var name: String = ""
    var imageName: String = ""
    var subtotal: String = ""
    var total: String = ""
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func submitBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        imageView.image = UIImage(named: imageName)
        subtotalLabel.text = subtotal
        totalLabel.text = total
    }
}
