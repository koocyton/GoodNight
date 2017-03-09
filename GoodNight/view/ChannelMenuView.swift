//
//  ChannelMenu.swift
//  GoodNight
//
//  Created by 刘毅 on 2017/3/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

// 屏幕宽
let screenWidth : CGFloat = UIScreen.main.bounds.size.width
// 屏幕高
let screenHeight : CGFloat = UIScreen.main.bounds.size.height
// 顶部状态的高度
let statusBarHeight : CGFloat = CGFloat(20)
// 底部导航的高度
let tabBarHeight : CGFloat =  CGFloat(49)
// 滑动标签页高度
let scrollLabelHeight : CGFloat = CGFloat(39)
// 菜单单个 Label 的宽度
let scrollLabelWidth : CGFloat = CGFloat(80)
// 菜单数据
let channelModel : ChannelModel = ChannelModel()
// 频道内容区高度
let channelContentHeight : CGFloat = screenHeight - statusBarHeight - scrollLabelHeight - tabBarHeight
// 频道数量
let channelCount : Int = channelModel.data.count
// Cell 高度
let cellHeight : CGFloat = CGFloat(150)
// 当前频道的索引
var currentChannelIndex : Int = 0
// 音乐播放器高度
var audioPlayHeight : CGFloat = CGFloat(100)

class ChannelMenuView : UIScrollView {
    
    var clickTag : Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 频道数量
        let channelCount : Int = channelModel.data.count
        // 创建
        // self = UIScrollView.init(frame: self.view.bounds) // UIScreen.main.bounds
        // 背景色
        self.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        // x , y , width , height
        self.frame = CGRect(x: 0, y: 0, width: screenWidth, height: statusBarHeight + scrollLabelHeight)
        // 滑动 label 的内容区的大小
        self.contentSize = CGSize(width: CGFloat(channelCount) * scrollLabelWidth, height:scrollLabelHeight)
        // ScrollView偏移量
        // self.contentOffset = CGPoint(x:screenWidth, y:0)
        // 是否按页滚动
        // self.pagingEnabled = true
        // 水平滚动，而不显示滚动条
        self.alwaysBounceHorizontal = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        // self.delegate = self
        // tag
        self.tag = 110

        // var ii : Int = 0
        for ii in 0..<channelModel.data.count {
            // init Label View
            let channelLabel : ChannelMenuLabel = ChannelMenuLabel()
            // init Frame
            channelLabel.frame = CGRect(x: CGFloat(ii) * scrollLabelWidth, y: 22, width: scrollLabelWidth, height: scrollLabelHeight)
            channelLabel.text = "\(channelModel.data[ii]["name"])"
            if ii==0 {
                channelLabel.textColor = UIColor.white
                channelLabel.font = UIFont.systemFont(ofSize: 20)
            }
            // tag
            channelLabel.tag = 1000 + ii
            // 点击
            channelLabel.isUserInteractionEnabled = true
            channelLabel.addGestureRecognizer(UITapGestureRecognizer(target:channelLabel, action:#selector(channelLabel.showChannel)))
            // channelLabel.target(forAction: self, withSender: #selector(channelLabel.showChannel))
            // add view
            self.addSubview(channelLabel)
        }
        
        // 插入下划线
        /*let hrView = UIView(frame: (self.layer.bounds))
        hrView.frame = CGRect(x: 0, y: statusBarHeight + scrollLabelHeight - 1, width: screenWidth, height: 1)
        hrView.layer.backgroundColor = UIColor.gray.cgColor
        self.addSubview(hrView)*/
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ChannelMenuLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // let label6 = UILabel(frame: (scrollLabaleView?.bounds)!)
        // self.frame = CGRect(x: 0, y: 22, width: 60, height: scrollLabelHeight)
        // self.text = ""
        // self.layer.borderColor = UIColor.red.cgColor
        // self.layer.borderWidth = 1
        self.font = UIFont.systemFont(ofSize: 15)
        self.textAlignment = NSTextAlignment.center
        self.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        //self.shadowColor = UIColor.gray  //灰色阴影
        //self.shadowOffset = CGSize(width:1.5, height:1.5)  //阴影的偏移量
        // scrollLabaleView?.addSubview(label6)
    }
    
    func showChannel() {

        let channelContentView : ChannelContentView = self.superview?.superview?.viewWithTag(63) as! ChannelContentView

        channelContentView.contentOffset.x = CGFloat( self.tag - 1000 ) * screenWidth

        for mm in 0..<channelModel.data.count {
            
            let menuLabel = self.superview?.viewWithTag(1000 + mm) as! ChannelMenuLabel

            if ( mm == self.tag - 1000 ) {
                menuLabel.font = UIFont.systemFont(ofSize: 20)
                menuLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            }
            else {
                menuLabel.font = UIFont.systemFont(ofSize: 15)
                menuLabel.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
