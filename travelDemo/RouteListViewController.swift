//
//  RouteListViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/22.
//

import Foundation
import UIKit

class RouteListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var routeListView: UICollectionView!
    @IBAction func closeBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func backgroundBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        routeListView.delegate = self
        routeListView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "routeListCell", for: indexPath) as! RouteListCell
        let routeImage = UIImage(named: "route\(indexPath.item)")
        let dayGroup = ["4 day","1 day", "3 day", "10 day"]
        let moneyGroup = ["$30,000","$2000","$30.000","$100,000"]
        let descGroup = ["Photo","Sport","View","Photo"]
        let desc2Group = ["Food","Food","History","View"]
        let item = indexPath.item
        guard item < dayGroup.count, item < moneyGroup.count, item < descGroup.count, item < desc2Group.count else { return cell}
        let selectName = item > 0 ? "radio_unchecked" : "radio"
        let selectImage = UIImage(named: selectName)
        cell.routeImage.image = routeImage
        cell.dayLabel.text = dayGroup[item]
        cell.moneyLabel.text = moneyGroup[item]
        cell.descriptionLabel.text = descGroup[item]
        cell.description2Label.text = desc2Group[item]
        cell.selectImage.image = selectImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: (collectionView.bounds.height - 3) / 4.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for cell in collectionView.visibleCells {
            (cell as! RouteListCell).selectImage.image = UIImage(named: "radio_unchecked")
        }
        let cell = collectionView.cellForItem(at: indexPath)
        (cell as! RouteListCell).selectImage.image = UIImage(named: "radio")
    }
}

class RouteListCell: UICollectionViewCell {
    
    @IBOutlet weak var routeImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var description2Label: UILabel!
    @IBOutlet weak var selectImage: UIImageView!
}
