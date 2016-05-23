//
//  WebViewController.swift
//  micro_blog
//
//  Created by Nakayama on 2016/05/22.
//  Copyright © 2016年 Nakayama. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    func openWeb(){
        let url = NSURL(string: "http://www.oneblock.xyz")
        let urlRequest = NSURLRequest(URL: url!)
        webView.loadRequest(urlRequest)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        openWeb()
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }

}
