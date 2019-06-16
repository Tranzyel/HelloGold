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
            UserDefaults.standard.set(newValue, forKey: HGConstantKey.UserDefaults.Key.UserLoggedIn)
            UserDefaults.standard.synchronize()
        }
        
        get
        {
            return UserDefaults.standard.bool(forKey: HGConstantKey.UserDefaults.Key.UserLoggedIn)
        }
    }

    private override init(){}

    public func saveHistoricalSpotPrice(_ prices: Array<Any>?)
    {
        do
        {
            if let array = prices
            {
                let encodedData = try NSKeyedArchiver.archivedData(withRootObject: array, requiringSecureCoding: false)
                UserDefaults.standard.set(encodedData, forKey: HGConstantKey.UserDefaults.Key.SpotPriceHistories)
                UserDefaults.standard.synchronize()
            }
        }
        catch
        {
            print(error)
        }
    }
    
    public func loadHistoricalSpotPrice() -> Array<SpotPriceModel>
    {
        do
        {
            let data = UserDefaults.standard.object(forKey: HGConstantKey.UserDefaults.Key.SpotPriceHistories) as? Data
            
            if let savedData = data
            {
                guard let array = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? [SpotPriceModel] else
                {
                    return []
                }
                return array
            }
        }
        return []
    }
    
    public func removeHistoricalSpotPrice()
    {
        UserDefaults.standard.removeObject(forKey: HGConstantKey.UserDefaults.Key.SpotPriceHistories)
        UserDefaults.standard.synchronize()
    }
    
    public func saveUserData(_ user: RegisterUserModel?)
    {
        do
        {
            if let userData = user
            {
                let encodedData = try NSKeyedArchiver.archivedData(withRootObject: userData, requiringSecureCoding: false)
                UserDefaults.standard.set(encodedData, forKey: HGConstantKey.UserDefaults.Key.UserData)
                UserDefaults.standard.synchronize()
            }
        }
        catch
        {
            print(error)
        }
    }
    
    public func loadUserData() -> RegisterUserModel?
    {
        do
        {
            let data = UserDefaults.standard.object(forKey: HGConstantKey.UserDefaults.Key.UserData) as? Data
            
            if let savedData = data
            {
                if let userData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? RegisterUserModel
                {
                    return userData
                }
            }
        }
        return nil
    }
}
