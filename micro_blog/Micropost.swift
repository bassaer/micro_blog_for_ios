//
//  Micropost.swift
//  micro_blog
//
//  Created by Nakayama on 2016/05/15.
//  Copyright © 2016年 Nakayama. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class Micropost: Mappable, CustomStringConvertible {
    
    var id: Int?
    var title: String?
    var body: String?
    
    var description: String {
            return "title: \(self.title), body: \(self.body)"
    }
    
    init(title: String, body: String){
        self.title = title
        self.body = body
    }
    
    required init?(_ map: Map){}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
    
    class func getMicroposts(success success: [Micropost] -> Void, failure: NSError? -> Void) {
        Alamofire.request(.GET, "http://localhost:3000/microposts.json").responseJSON { response in
            if let error = response.result.error {
                failure(error)
                return
            }
            let json = JSON(response.result.value!)
            let microposts: [Micropost] = json.arrayValue.map{micropostJson -> Micropost in
                return Mapper<Micropost>().map(micropostJson.dictionaryObject!)!
            }
            success(microposts)
            return
        }
    }
    
    func createMicropost(success success: Void -> Void, failure: NSError? -> Void) {
        
        let params: [String: AnyObject] = [
            "title" : self.title!,
            "body" : self.body!
        ]
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/microposts.json")!)
        request.HTTPMethod = "POST"
        let alamofireRequest = Alamofire.ParameterEncoding.JSON.encode(request, parameters: params).0
        
        Alamofire.request(alamofireRequest).responseJSON { response in
            if let error = response.result.error {
                failure(error)
                return
            }
            success()
            return
        }
    }
    
    func deleteMicropost(success success: Void -> Void, failure: NSError? -> Void) {
        
        Alamofire.request(.DELETE, "http://localhost:3000/microposts/\(self.id!).json").responseJSON{ response in
            if let error = response.result.error {
                failure(error)
                return
            }
            success()
            return
        }
    }
    
}
