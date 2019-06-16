//
//  RegisterUserModel.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-13.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit
import ObjectMapper

class RegisterUserModel: NSObject,NSCoding,Mappable {
    
    var code: Int!
    var result: String?
    var account_number: String?
    var api_key: String?
    var api_token: String?
    var public_key: String?
    var userEmail: String?
    
    override init() {}
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        code                <- map["code"]
        result              <- map["result"]
        account_number      <- map["data.account_number"]
        api_key             <- map["data.api_key"]
        api_token           <- map["data.api_token"]
        public_key          <- map["data.public_key"]
        userEmail           = UserData.shared.userEmail
    }
    
    required convenience init(coder aDecoder: NSCoder)
    {
        self.init()
        
        result = aDecoder.decodeObject(forKey: "result") as? String
        account_number = aDecoder.decodeObject(forKey: "account_number") as? String
        userEmail = aDecoder.decodeObject(forKey: "userEmail") as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(result, forKey: "result")
        aCoder.encode(account_number, forKey: "account_number")
        aCoder.encode(userEmail, forKey: "userEmail")
    }
}
