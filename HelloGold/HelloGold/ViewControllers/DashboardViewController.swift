//
//  DashboardViewController.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-13.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    var historicalSpotPrice = SpotPrices.shared.loadHistoricalSpotPrice()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        requestGoldPrice()
    }

    func requestGoldPrice()
    {
        NetworkManager.shared.requestGoldPrice { (response, error) in
            if let spotPrice = response as? SpotPriceModel
            {
                self.historicalSpotPrice.append(spotPrice)
                SpotPrices.shared.saveHistoricalSpotPrice(self.historicalSpotPrice)
            }
        }
    }
}
