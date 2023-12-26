//
//  ToolboxCollectionView.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/22.
//

import Foundation
import UIKit

class ToolboxViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let cellGroup = [
        ["Wallet","Traffic","Simcard","Schedule"],
        ["Restaurant","Hotel","Shopping","Viewpoint"],
        ["Share","Mission","Reward","Memory"]
    ]

    
    @IBAction func homeButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var toolboxCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toolboxCollectionView.dataSource = self
        toolboxCollectionView.delegate = self
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = cellGroup[indexPath.section][indexPath.row]
        if title == "Schedule" {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(identifier: "CalanderViewController")
            self.navigationController?.pushViewController(viewController, animated: true);
        } else if title == "Restaurant" {
            performSegue(withIdentifier: "toRestaurant", sender: nil)
        } else if title == "Memory" {
            performSegue(withIdentifier: "toMemory", sender: nil)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "toolboxCell", for: indexPath) as! ToolboxCollectionViewCell
        guard indexPath.section < cellGroup.count else {
            return cell
        }
        guard indexPath.item < cellGroup[indexPath.section].count else {
            return cell
        }
        let imageName = cellGroup[indexPath.section][indexPath.item]
        cell.cellImage.image = UIImage(named: imageName)
        cell.cellLabel.text = imageName
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.bounds.width - 10) / 4.0
        let cellHeight = cellWidth * 1.2
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "toolboxHeader", for: indexPath) as! ToolboxCollectionViewHeader
        let headerGroup = ["Convenient","Recommend","Tour"]
        guard indexPath.section < headerGroup.count else {
            return header
        }
        let labelText = headerGroup[indexPath.section]
        header.headerLabel.text = labelText
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}

class ToolboxCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
}

class ToolboxCollectionViewHeader: UICollectionReusableView {
    
    @IBOutlet weak var headerLabel: UILabel!
}
