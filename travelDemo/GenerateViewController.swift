//
//  GenerateViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/22.
//

import Foundation
import UIKit

class GenerateViewController: UIViewController {
    
    var progressTimer: Timer?
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        progressView.transform = CGAffineTransformRotate(progressView.transform, 90*Double.pi/180)
        progressView.transform = CGAffineTransformScale(progressView.transform, 2, 10)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if progressTimer == nil {
            progressTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(GenerateViewController.timeChanged), userInfo: nil, repeats: true)
        }
        
        
    }
    
    @objc func timeChanged() {
//        NSLog("1s has passed")
//        
//        if progressView.progress < 1 {
//            progressView.progress += 0.5
//        } else {
//            progressTimer?.invalidate()
//            performSegue(withIdentifier: "generateToHome", sender: nil)
//        }
    }
    
}
