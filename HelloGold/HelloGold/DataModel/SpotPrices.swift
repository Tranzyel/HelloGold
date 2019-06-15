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
