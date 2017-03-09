//
//  ChannelMenu.swift
//  GoodNight
//
//  Created by 刘毅 on 2017/3/1.
//  Copyright © 2017年 刘毅. All rights reserved.
//

import UIKit

import AVFoundation

import MediaPlayer

class ChannelAudioView : UIView {

    var audioPlayer: AVAudioPlayer? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // x 坐标
        let yy = screenHeight - audioPlayHeight - tabBarHeight
        // 背景色
        self.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 0.5)
        // x , y , width , height
        self.frame = CGRect(x: 0, y: yy, width: screenWidth, height: audioPlayHeight)
        // 隐藏
        self.isHidden = true
        // tag
        self.tag = 51
        
        // 毛玻璃效果
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: audioPlayHeight)
        self.addSubview(blurView)

        // 封面图
        let cover = UIImageView.init(frame: self.layer.bounds)
        cover.frame = CGRect(x: 15, y: 15, width: 70, height: 70)
        cover.image = UIImage(named: "normal")
        self.addSubview(cover)
        
        // 分割线
        let hrView = UIView(frame: (self.layer.bounds))
        hrView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 1)
        hrView.layer.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.5).cgColor
        blurView.addSubview(hrView)
        
        let playbtn = UIButton()
        playbtn.frame = CGRect(x:250 , y:15, width:30, height:30)
        //playbtn.backgroundColor = UIColor.black
        playbtn.setTitle("▶", for: .normal)
        playbtn.setTitleColor(UIColor.black, for: .normal)

        let pausebtn = UIButton(frame: CGRect(x:280, y:15, width:30, height:30) )
        pausebtn.setTitle("■", for: .normal)
        pausebtn.setTitleColor(UIColor.black, for: .normal)
        //pausebtn.backgroundColor = UIColor.black
        blurView.addSubview(playbtn)
        blurView.addSubview(pausebtn)
        
        playbtn.addTarget(self, action: #selector(ChannelAudioView.play), for: .touchUpInside)
        pausebtn.addTarget(self, action: #selector(ChannelAudioView.stop), for: .touchUpInside)
    }
    
    func hidden() {
        self.isHidden = true
    }
    
    func nohidd() {
        self.isHidden = false
    }
    
    func stop() {
        if audioPlayer != nil {
            audioPlayer?.stop()
        }
        self.hidden()
    }
    
    func play(){
        // let path = Bundle.main.path(forResource: "zjl", ofType: "m4a")
        let url = Bundle.main.url(forResource: "gqq", withExtension: "mp3")!
        do {
            /*audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let audioPlayer = audioPlayer else { return }
            print(audioPlayer)
            audioPlayer.prepareToPlay()*/
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            self.nohidd()
        } catch let error as NSError {
            print(error.description)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
