//
//  Micropost.swift
//  micro_blog
//
//  Created by Nakayama on 2016/05/15.
//  Copyright © 2016年 Nakayama. All rights reserved.
//

import UIKit

class Micropost: CustomStringConvertible {
    
    let title: String
    let body: String
    
    var description: String {
            return "title: \(self.title), body: \(self.body)"
    }
    
    init(title: String, body: String){
        self.title = title
        self.body = body
    }
    
}
