//
//  MicropostCreateFormController.swift
//  micro_blog
//
//  Created by Nakayama on 2016/05/15.
//  Copyright © 2016年 Nakayama. All rights reserved.
//

import UIKit

class MicropostCreateFormController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    
    
    @IBAction func cancelPost(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func createNewPost(sender: UIBarButtonItem) {
        
        let micropost = Micropost(title: titleText.text!, body: bodyText.text!)
        micropost.createMicropost(
            success: {
                print("Success create")
            },
            failure: {(error) in
                print("Fail create")
            }
        )
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}