//
//  SecondViewController.swift
//  GoodNight
//
//  Created by 刘毅 on 2016/12/30.
//  Copyright © 2016年 刘毅. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    // 顶部滑动菜单
    let channelMenuView :ChannelMenuView = ChannelMenuView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // 插入顶部菜单的面板
        self.view.addSubview(channelMenuView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
