//
//  LoginViewController.swift
//  micro_blog
//
//  Created by Nakayama on 2016/05/23.
//  Copyright © 2016年 Nakayama. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    @IBAction func login(sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        passText.secureTextEntry = true
        emailText.delegate = self
        passText.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        emailText.resignFirstResponder()
        passText.resignFirstResponder()
        return true
    }
    
    
}