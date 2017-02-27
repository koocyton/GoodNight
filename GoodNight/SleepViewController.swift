//
//  SecondViewController.swift
//  GoodNight
//
//  Created by 刘毅 on 2016/12/30.
//  Copyright © 2016年 刘毅. All rights reserved.
//

import UIKit

class SleepViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet var CollectionView: [UICollectionView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //实现UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //返回记录数
        return 100;
    }
    
    //实现UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        //返回Cell内容，这里我们使用刚刚建立的defaultCell作为显示内容
        var cell:MyColletionCell  = CollectionView.dequeueReusableCellWithReuseIdentifier("defaultCell", forIndexPath: indexPath) as! MyColletionCell
        cell.label.text = "\(indexPath.section):\(indexPath.row)"
        return cell;
    }
    
    //实现UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        //某个Cell被选择的事件处理
    }

}

