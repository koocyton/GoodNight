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
    // 顶部状态的高度
    let statusBarHeight :CGFloat = CGFloat(20)
    // 底部导航的高度
    let tabBarHeight :CGFloat =  CGFloat(49)
    // 滑动标签页高度
    let scrollLabelHeight :CGFloat = CGFloat(39)

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
        scrollLabaleView?.frame = CGRect(x: 0, y: 0, width: screenWidth, height: statusBarHeight + scrollLabelHeight)
        // ScrollView偏移量
        // scrollLabaleView?.contentOffset = CGPoint(x:screenWidth, y:0)
        // 是否按页滚动
        // scrollLabaleView?.pagingEnabled = true
        // 水平滚动，而不显示滚动条
        scrollLabaleView?.alwaysBounceHorizontal = true
        scrollLabaleView?.showsHorizontalScrollIndicator = false
        scrollLabaleView?.showsVerticalScrollIndicator = false
        
        // scrollLabaleView?.layer.borderWidth = 1
        //scrollLabaleView?.layer.borderColor = UIColor.red.cgColor
        scrollLabaleView?.delegate = self
        
        let label = UILabel(frame: (scrollLabaleView?.bounds)!)
        label.frame = CGRect(x: 0, y: 22, width: 60, height: scrollLabelHeight)
        label.text = "轻音乐"
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.blue
        // label.font = UIFont.systemFontOfSize(23)
        scrollLabaleView?.addSubview(label)
        
        
        let label2 = UILabel(frame: (scrollLabaleView?.bounds)!)
        label2.frame = CGRect(x: 70, y: 22, width: 60, height: scrollLabelHeight)
        label2.text = "大自然"
        label2.textAlignment = NSTextAlignment.center
        label2.textColor = UIColor.blue
        scrollLabaleView?.addSubview(label2)
        
        let label3 = UILabel(frame: (scrollLabaleView?.bounds)!)
        label3.frame = CGRect(x: 140, y: 22, width: 60, height: scrollLabelHeight)
        label3.text = "歌曲"
        label3.font = UIFont.systemFont(ofSize: 22)
        label3.textAlignment = NSTextAlignment.center
        label3.textColor = UIColor.blue
        scrollLabaleView?.addSubview(label3)
        
        let label4 = UILabel(frame: (scrollLabaleView?.bounds)!)
        label4.frame = CGRect(x: 180, y: 22, width: 60, height: scrollLabelHeight)
        label4.text = "诵读"
        label4.textAlignment = NSTextAlignment.center
        label4.textColor = UIColor.blue
        scrollLabaleView?.addSubview(label4)
        
        let label5 = UILabel(frame: (scrollLabaleView?.bounds)!)
        label5.frame = CGRect(x: 230, y: 22, width: 60, height: scrollLabelHeight)
        label5.text = "电台"
        label5.textAlignment = NSTextAlignment.center
        label5.textColor = UIColor.blue
        scrollLabaleView?.addSubview(label5)
        
        let label6 = UILabel(frame: (scrollLabaleView?.bounds)!)
        label6.frame = CGRect(x: 280, y: 22, width: 60, height: scrollLabelHeight)
        label6.text = "英语"
        label6.textAlignment = NSTextAlignment.center
        label6.textColor = UIColor.blue
        scrollLabaleView?.addSubview(label6)
        
        // 插入
        self.view.addSubview(scrollLabaleView!)
        
        let ppp = UIView(frame: (scrollLabaleView?.bounds)!)
        ppp.frame = CGRect(x: 0, y: statusBarHeight + scrollLabelHeight - 1, width: screenWidth, height: 1)
        ppp.layer.backgroundColor = UIColor.gray.cgColor
        self.view.addSubview(ppp)
    }

    func addCollectionView () {

        let layout = UICollectionViewFlowLayout()
        //滚动方向
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        layout.itemSize = CGSize(width:Int(screenWidth / 2), height:Int(screenWidth / 2))
        //上下间隔
        layout.minimumLineSpacing = 0
        //左右间隔
        layout.minimumInteritemSpacing = 0
        // init collection
        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        // x  y   width height
        collectionView?.frame = CGRect(x: 0, y: statusBarHeight + scrollLabelHeight, width: screenWidth, height: screenHeight-statusBarHeight-scrollLabelHeight-tabBarHeight)
        // delegate
        collectionView?.delegate = self
        collectionView?.dataSource = self;
        //注册一个cell
        collectionView!.register(HotCell.self, forCellWithReuseIdentifier:"HotCell")
        collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
    }
    
    // 有多少个 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16;
    }
    
    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // default cover
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotCell", for: indexPath) as! HotCell
        cell.frame = CGRect(x: (indexPath.row % 2) * Int(screenWidth / 2), y: Int(indexPath.row / 2) * Int(screenWidth / 2), width: Int(screenWidth / 2), height: Int(screenWidth / 2))
        // cell.layer.borderColor = UIColor.gray.cgColor
        // cell.layer.borderWidth = 1
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
    
    var image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let cellWidth = self.layer.bounds.size.width

        label = UILabel.init(frame: self.bounds)
        self.addSubview(label)
        
        image = UIImageView.init(frame: self.layer.bounds)
        image.frame = CGRect(x: 20, y: 20, width: cellWidth - 40, height: cellWidth - 40)
        image.image = UIImage(named: "normal")
        self.addSubview(image)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
