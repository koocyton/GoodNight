//
//  FirstViewController.swift
//  GoodNight
//
//  Created by 刘毅 on 2016/12/30.
//  Copyright © 2016年 刘毅. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // request url
        let url = URL(string: "https://github.com/koocyton");
        let request = URLRequest(url: url!);
        webView.loadRequest(request)
        
        // load local html
        //let path = Bundle.main.path(forResource: "PersonView", ofType: "html")
        //let url = NSURL.fileURL(withPath: path!)
        //webView.loadRequest(URLRequest(url: url))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
