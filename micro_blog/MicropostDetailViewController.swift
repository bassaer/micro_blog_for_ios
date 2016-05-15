//
//  MicropostDetailViewController.swift
//  micro_blog
//
//  Created by Nakayama on 2016/05/15.
//  Copyright © 2016年 Nakayama. All rights reserved.
//

import UIKit

class MicropostDetailViewController: UIViewController {
    
    var micropost: Micropost?
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let micropost = self.micropost {
            titleTextLabel.text = micropost.title
            bodyTextLabel.text = micropost.body
            
            titleTextLabel.layer.borderColor = UIColor.blueColor().CGColor
            bodyTextLabel.layer.borderColor = UIColor.blueColor().CGColor
            
            titleTextLabel.layer.borderWidth = 1.0
            bodyTextLabel.layer.borderWidth = 1.0
        }
    }
    
    
}
