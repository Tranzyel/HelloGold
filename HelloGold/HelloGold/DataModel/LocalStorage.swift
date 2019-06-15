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
    
    public var registerUserData: RegisterUserModel?
    public var spotPriceData: SpotPriceModel?        
    public var loggedIn: Bool
    {
        set (newValue)
        {
            UserDefaults.standard.set(newValue, forKey: HGConstantKey.UserDefaults.Key.UserLoggedInKey)
            UserDefaults.standard.synchronize()
        }
        
        get
        {
            return UserDefaults.standard.bool(forKey: HGConstantKey.UserDefaults.Key.UserLoggedInKey)
        }
    }

    private override init(){}

    public func saveHistoricalSpotPrice(_ prices: SpotPrices)
    {
        do
        {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: prices, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: HGConstantKey.UserDefaults.Key.SpotPriceHistoriesKey)
            UserDefaults.standard.synchronize()
        }
        catch
        {
            print(error)
        }
    }
    
    public func removeHistoricalSpotPrice()
    {
        UserDefaults.standard.removeObject(forKey: HGConstantKey.UserDefaults.Key.SpotPriceHistoriesKey)
    }
}
