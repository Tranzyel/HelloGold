//
//  DashboardViewController.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-13.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

let GoldPriceTableViewCellIdentifier = "GoldPriceTableViewCellIdentifier"

internal enum CellType: Int
{
    case todayGoldPrice = 0
    case pastGoldPrice = 1
}

class DashboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var historicalSpotPrice = LocalStorage.shared.loadHistoricalSpotPrice()
    let goldPriceNib = UINib(nibName: String(describing: GoldPriceCell.self), bundle: nil)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        requestGoldPrice()
        tableView.register(goldPriceNib, forCellReuseIdentifier: GoldPriceTableViewCellIdentifier)
    }

    func requestGoldPrice()
    {
        NetworkManager.shared.requestGoldPrice { (response, error) in
            if let spotPrice = response as? SpotPriceModel
            {
                self.historicalSpotPrice.insert(spotPrice, at: 0)
                LocalStorage.shared.saveHistoricalSpotPrice(self.historicalSpotPrice)
                self.tableView.reloadData()
            }
        }
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = GoldPriceTableHeaderView.loadNib() as! GoldPriceTableHeaderView
        
        switch section
        {
            case CellType.todayGoldPrice.rawValue:
                headerView.titleLbl.text = "Today Price"
            case CellType.pastGoldPrice.rawValue:
                headerView.titleLbl.text = "Previous Price"
            default:
                headerView.titleLbl.text = "Gold Price"
        }
        
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 190
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section
        {
            case CellType.todayGoldPrice.rawValue:
                return 1
            case CellType.pastGoldPrice.rawValue:
                return historicalSpotPrice.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.section
        {
            case CellType.todayGoldPrice.rawValue:
                return todaySpotPrice(tableView: tableView, cellForRowAt: indexPath)
            case CellType.pastGoldPrice.rawValue:
                return historicalSpotPrice(tableView: tableView, cellForRowAt: indexPath)
            default:
                return todaySpotPrice(tableView: tableView, cellForRowAt: indexPath)
        }
    }
    
    private func historicalSpotPrice(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> GoldPriceCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: GoldPriceTableViewCellIdentifier, for: indexPath) as! GoldPriceCell
        
        let model = historicalSpotPrice[indexPath.row] as SpotPriceModel
        
        cell.buyPrice.text = "\(model.buyPrice ?? 0.0)"
        cell.sellPrice.text = "\(model.sellPrice ?? 0.0)"
        cell.spotPrice.text = "\(model.spotPrice ?? 0.0)"
        cell.date.text = model.date
        cell.time.text = model.time
        
        return cell
    }
    
    private func todaySpotPrice(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> GoldPriceCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: GoldPriceTableViewCellIdentifier, for: indexPath) as! GoldPriceCell
        
        let model = historicalSpotPrice[indexPath.row] as SpotPriceModel
        
        cell.buyPrice.text = "\(model.buyPrice ?? 0.0)"
        cell.sellPrice.text = "\(model.sellPrice ?? 0.0)"
        cell.spotPrice.text = "\(model.spotPrice ?? 0.0)"
        cell.date.text = model.date
        cell.time.text = model.time
        
        return cell
    }
}
