//
//  ShareViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/28.
//

import Foundation
import UIKit

class ShareViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "share", for: indexPath) as! ShareCell
        let item = indexPath.item
        let nameGroup = ["2024-01-01","2024-01-02","2024-01-04"]
        let likeGroup = ["12","20","8"]
        let commentGroup = ["5","1","3"]
        let placeGroup = ["osaka castle","osaka park","shop street"]
        let imageName = "share\(item*2)"
        let imageTwoName = "share\(item*2+1)"
        guard item < nameGroup.count, item < likeGroup.count, item < commentGroup.count, item < placeGroup.count else { return cell }
        cell.nameLabel.text = nameGroup[item]
        cell.likeLabel.text = likeGroup[item]
        cell.commentLabel.text = commentGroup[item]
        cell.placeLabel.text = placeGroup[item]
        cell.imageView.image = UIImage(named: imageName)
        cell.imageTwoView.image = UIImage(named: imageTwoName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
}

class ShareCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTwoView: UIImageView!
}
