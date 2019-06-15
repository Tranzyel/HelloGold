//
//  HGConstantKey.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-14.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class HGConstantKey: NSObject {

    struct UserDefaults {
        struct Key {
            static let SpotPriceHistoriesKey: String = "SpotPriceHistoriesKey"
            static let UserLoggedInKey: String = "UserLoggedInKey"
        }
    }

    struct DateFormatterFormat {
        struct DateFormat {
            static let Default: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            static let Date: String = "yyyy-MM-dd"
            static let Time: String = "HH:mm:ss"
        }
    }
}
