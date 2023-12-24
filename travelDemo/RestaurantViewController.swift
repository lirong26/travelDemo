//
//  RestaurantViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/24.
//

import Foundation
import UIKit

class RestaurantViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurant", for: indexPath) as! RestaurantCell
        let item = indexPath.item
        let imageName = "restaurant\(item)"
        let image = UIImage(named: imageName)
        let descGroup = ["Description of the restaurant","Specialty or popular dish","Specialty or popular dish"]
        let timeLabel = "Opening hours and availability"
        guard item < descGroup.count else {return  cell}
        cell.imageView.image = image
        cell.descLabel.text = descGroup[item]
        cell.timeLabel.text = timeLabel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("item\(indexPath.item) is selected")
        performSegue(withIdentifier: "restaurantToDetail", sender: nil)
    }
}

class RestaurantCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
}
