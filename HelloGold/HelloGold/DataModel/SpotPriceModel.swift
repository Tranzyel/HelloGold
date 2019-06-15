//
//  SpotPriceModel.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-13.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit
import ObjectMapper

class SpotPriceModel: NSObject,NSCoding,Mappable  {
    
    var result: String?
    var buyPrice: CGFloat?
    var sellPrice: CGFloat?
    var spotPrice: CGFloat?
    var timeStamp: Date?
    var date: String?
    var time: String?
    
    override init() {}
    
    required init?(map: Map){
        super.init()
    }

    func mapping(map: Map)
    {
        let dateTransform = CustomDateFormatTransform(formatString: HGConstantKey.DateFormatterFormat.DateFormat.Default)
        
        result    <- map["result"]
        buyPrice  <- map["data.buy"]
        sellPrice <- map["data.sell"]
        spotPrice <- map["data.spot_price"]
        timeStamp <- (map["timestamp"], dateTransform)
        
        let convertedDate = HGDateFormatter.shared.getDateValue(format: HGConstantKey.DateFormatterFormat.DateFormat.Date, date: timeStamp ?? NSDate() as Date)
        let convertedTime = HGDateFormatter.shared.getDateValue(format: HGConstantKey.DateFormatterFormat.DateFormat.Time, date: timeStamp ?? NSDate() as Date)
        
        date      = convertedDate        
        time      = convertedTime
    }
    
    required convenience init(coder aDecoder: NSCoder)
    {
        self.init()
        
        result = aDecoder.decodeObject(forKey: "result") as? String
        buyPrice = aDecoder.decodeObject(forKey: "data.buy") as? CGFloat
        sellPrice = aDecoder.decodeObject(forKey: "data.sell") as? CGFloat
        spotPrice = aDecoder.decodeObject(forKey: "data.spot_price") as? CGFloat
        timeStamp = aDecoder.decodeObject(forKey: "timestamp") as? Date
        date = aDecoder.decodeObject(forKey: "date") as? String
        time = aDecoder.decodeObject(forKey: "time") as? String
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(result, forKey: "result")
        aCoder.encode(buyPrice, forKey: "data.buy")
        aCoder.encode(sellPrice, forKey: "data.sell")
        aCoder.encode(spotPrice, forKey: "data.spot_price")
        aCoder.encode(timeStamp, forKey: "timestamp")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(time, forKey: "time")
    }
}

