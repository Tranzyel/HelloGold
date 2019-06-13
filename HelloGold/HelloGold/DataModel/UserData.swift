//
//  UserData.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-12.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class UserData: NSObject {

    static let shared = UserData()
    
    private override init() {}
    
    var userEmail: String?
    var userUUID: String?
}
