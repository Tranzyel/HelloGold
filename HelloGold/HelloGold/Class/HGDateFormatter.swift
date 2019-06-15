//
//  HGDateFormatter.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-15.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class HGDateFormatter {
    
    static let shared = HGDateFormatter()
    
    public func getDateValue(format: String, date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = HGConstantKey.DateFormatterFormat.DateFormat.Default
        
        let customDateFormatter = DateFormatter()
        customDateFormatter.dateFormat = format
        
        let defaultDateString = dateFormatter.string(from: date)
        
        let date: Date? = dateFormatter.date(from: defaultDateString)
        
        return customDateFormatter.string(from: date ?? Date())
    }
}
