//
//  SpotPrices.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-14.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class SpotPrices: NSObject, NSCoding {

    static let shared = SpotPrices()

    public var historicalSpotPrices: [SpotPriceModel]?
    
    public func saveHistoricalSpotPrice(_ prices: Array<Any>?)
    {
        do
        {
            if let array = prices
            {                
                let encodedData = try NSKeyedArchiver.archivedData(withRootObject: array, requiringSecureCoding: false)
                UserDefaults.standard.set(encodedData, forKey: HGConstantKey.UserDefaults.Key.SpotPriceHistoriesKey)
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
            let data = UserDefaults.standard.object(forKey: HGConstantKey.UserDefaults.Key.SpotPriceHistoriesKey) as? Data
            
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
    
    required convenience init(coder aDecoder: NSCoder)
    {
        self.init(coder: aDecoder)
        aDecoder.decodeObject(forKey: "historicalPrice")
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(historicalSpotPrices, forKey: "historicalPrice")
    }
}
