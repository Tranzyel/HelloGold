//
//  LocalStorage.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-13.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class LocalStorage: NSObject {
    
    static let shared = LocalStorage()
    
    private override init() {}
    
    public var registerUserData: RegisterUserModel?
}
