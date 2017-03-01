//
//  SecondViewController.swift
//  GoodNight
//
//  Created by 刘毅 on 2016/12/30.
//  Copyright © 2016年 刘毅. All rights reserved.
//

import UIKit

class SleepViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var catalogCollectionView: UICollectionView!
    
    @IBOutlet weak var coverCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        catalogCollectionView.dataSource = self
        catalogCollectionView.delegate = self

        coverCollectionView.dataSource = self
        coverCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 有多少个 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // catalog
        if (collectionView == catalogCollectionView) {
            return 18;
        }

        // default cover
        return 18;
    }
    
    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // catalog
        if (collectionView == catalogCollectionView) {

            let catalogCell = collectionView.dequeueReusableCell(withReuseIdentifier: "catalogCell", for: indexPath) as! CatalogCell
            catalogCell.catalogLabel.text = "\(indexPath.section):\(indexPath.row)"
            return catalogCell
        }

        // default cover
        let coverCell = collectionView.dequeueReusableCell(withReuseIdentifier: "coverCell", for: indexPath) as! CoverCell
        coverCell.coverImage.image = UIImage(named:"normal")
        return coverCell
    }
}

class CatalogCell: UICollectionViewCell {

    @IBOutlet var catalogLabel: UILabel!
    
}

class CoverCell: UICollectionViewCell {

    @IBOutlet var coverImage: UIImageView!
    
}
