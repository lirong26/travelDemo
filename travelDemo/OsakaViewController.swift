//
//  OsakaViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2024/1/9.
//

import Foundation
import UIKit
import SwiftyGif

class OsakaViewController: UIViewController {
    
    @IBOutlet weak var fireworkView: UIImageView!
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let gif = try UIImage(gifName: "firework")
            fireworkView.setGifImage(gif, manager: SwiftyGifManager.defaultManager)
            fireworkView.startAnimatingGif()
        } catch {
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        SwiftyGifManager.defaultManager.deleteImageView(fireworkView)
    }
}
