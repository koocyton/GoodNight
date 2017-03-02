//
//  SecondViewController.swift
//  GoodNight
//
//  Created by 刘毅 on 2016/12/30.
//  Copyright © 2016年 刘毅. All rights reserved.
//

import UIKit

class SleepViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {

    // 屏幕宽
    let screenWidth :CGFloat = UIScreen.main.bounds.size.width
    // 屏幕高
    let screenHeight :CGFloat = UIScreen.main.bounds.size.height
    // 滑动标签页高度
    let scrollLabelHeight :CGFloat = CGFloat(40)

    // 滑动标签
    var scrollLabaleView :UIScrollView?
    // 滑动标签
    var collectionView :UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addScrollLabelView()
        addCollectionView()
    }
    
    func addScrollLabelView() {
        // 创建
        scrollLabaleView = UIScrollView.init(frame: self.view.bounds) // UIScreen.main.bounds
        // 背景色
        scrollLabaleView?.backgroundColor = UIColor.green
        // x , y , width , height
        scrollLabaleView?.frame = CGRect(x: 0, y: 0, width: screenWidth, height: scrollLabelHeight)
        // ScrollView偏移量
        // scrollLabaleView?.contentOffset = CGPoint(x:screenWidth, y:0)
        // 是否按页滚动
        // scrollLabaleView?.pagingEnabled = true
        // 水平滚动，而不显示滚动条
        scrollLabaleView?.alwaysBounceHorizontal = true
        scrollLabaleView?.showsHorizontalScrollIndicator = false
        scrollLabaleView?.showsVerticalScrollIndicator = false
        // 协议
        scrollLabaleView?.delegate = self
        // 插入
        self.view.addSubview(scrollLabaleView!)
    }

    func addCollectionView () {

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:80,height:35)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        
        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView?.frame = CGRect(x: 0, y: scrollLabelHeight, width: screenWidth, height: screenWidth-scrollLabelHeight)
        collectionView?.delegate = self
        collectionView?.dataSource = self;
        //注册一个cell
        collectionView!.register(HotCell.self, forCellWithReuseIdentifier:"HotCell")
        collectionView?.backgroundColor = UIColor.blue
        self.view.addSubview(collectionView!)
    }
    
    // 有多少个 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18;
    }
    
    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // default cover
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotCell", for: indexPath) as! HotCell
        cell.backgroundColor = UIColor.red
        cell.label.text = "aaaa"
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class HotCell: UICollectionViewCell {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel.init(frame: self.bounds)
        self.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
