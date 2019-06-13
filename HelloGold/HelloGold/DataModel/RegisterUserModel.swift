//
//  RegisterUserModel.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-13.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit
import ObjectMapper

class RegisterUserModel: Mappable {
    
    var code: Int!
    var result: String?
    var account_number: String?
    var api_key: String?
    var api_token: String?
    var public_key: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        code                <- map["code"]
        result              <- map["result"]
        account_number      <- map["data.account_number"]
        api_key             <- map["data.api_key"]
        api_token           <- map["data.api_token"]
        public_key          <- map["data.public_key"]
    }
    
}
