//
//  LandingViewController.swift
//  travelDemo
//
//  Created by ByteDance on 2023/12/23.
//

import UIKit
import SwiftyGif

class LandingViewController: UIViewController {
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
            imageView.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo:view.trailingAnchor)
        ])
        do {
            let gif = try UIImage(gifName: "japan_road_trip_shikoku_itineraire_etapes_carte_illustree")
            imageView.setGifImage(gif)
        } catch {
            
        }

        btn.setImage(UIImage(named: "plain"), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("continue", for: .normal)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0) - 50),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btn.heightAnchor.constraint(equalToConstant: 50),
            btn.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
}
