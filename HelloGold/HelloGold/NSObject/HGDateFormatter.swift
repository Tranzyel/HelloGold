//
//  HGDateFormatter.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-15.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class HGDateHelper {
    
    static let shared = HGDateHelper()
    
    public func getDateValue(format: String, date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = HGConstantKey.DateFormatter.Format.Default
        
        let customDateFormatter = DateFormatter()
        customDateFormatter.dateFormat = format
        
        let defaultDateString = dateFormatter.string(from: date)
        
        let date: Date? = dateFormatter.date(from: defaultDateString)
        
        return customDateFormatter.string(from: date ?? Date())
    }
    
    public func getTodayDate() -> String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = HGConstantKey.DateFormatter.Format.Current
        
        let todayDateString = formatter.string(from: date)
        formatter.dateFormat = HGConstantKey.DateFormatter.Format.Date
        
        let currentDate = formatter.date(from: todayDateString) ?? date
        
        return formatter.string(from: currentDate)
    }
}
