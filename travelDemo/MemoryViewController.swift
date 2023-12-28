//
//  MemoryViewController.swift
//  travelDemo
//
//  Created by Ruyi Li on 2023/12/26.
//

import Foundation
import UIKit

class MemoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBAction func pageViewClicked(_ sender: Any) {
        let offsetX = collectionView.contentOffset.x
        let offsetY = collectionView.contentOffset.y
        collectionView.setContentOffset(CGPoint(x: offsetX, y: offsetY + collectionView.frame.height), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        headerView.frame = CGRect(x: 0, y: -150 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), width: UIScreen.main.bounds.width, height: 200)
        pageView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
        headerView.alpha = 0.8
        pageView.alpha = 0.8
        UIView.animate(withDuration: 0.5) {
            self.headerView.alpha = 1
            self.headerView.frame = CGRect(x: 0, y: -100 + (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0), width: UIScreen.main.bounds.width, height: 200)
            self.pageView.alpha = 1
            self.pageView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width, height: 200)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = UIColor.clear
        
        self.view.sendSubviewToBack(backgroundView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y + scrollView.frame.height > scrollView.contentSize.height - 10 {
            UIView.animate(withDuration: 0.5) {
                self.pageView.alpha = 0
                self.pageView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.pageView.alpha = 1
                self.pageView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width, height: 200)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = indexPath.item % 4
        let imageName = "memory\(item)"
        let timeGroup = ["2024-01-01","2024-01-02","2024-01-03","2024-01-04",
                         "2024-01-05","2024-01-06","2024-01-07","2024-01-08"]
        let descGroup = ["You go to the castle and bababb. bababababd. babbbaab",
                         "Go to the park bvbc fgdfg dfgdfgdf fdg. rfgfdgdf gd. gfdg",
                         "Snow board! dsfdsfsd fdv fg dfsfd d. f sdfds fdf fsd fsdfdf dsf dsf",
                         "Have picnic with XX dsfdsf sdfsd dfsd dsfs ds dfs sd dsfds d"]
        guard indexPath.item < timeGroup.count, item < descGroup.count else {
            return UICollectionViewCell()
        }
        if item % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memoryLeft", for: indexPath) as! MemoryLeftCell
            cell.imageView.image = UIImage(named: imageName)
            cell.timeLabel.text = timeGroup[indexPath.item]
            cell.descTextView.text = descGroup[item]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memoryRight", for: indexPath) as! MemoryRightCell
            cell.imageView.image = UIImage(named: imageName)
            cell.timeLabel.text = timeGroup[indexPath.item]
            cell.descTextView.text = descGroup[item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 4)
    }
    
}

class MemoryLeftCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
}

class MemoryRightCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
}
