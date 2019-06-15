//
//  GoldPriceCell.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-15.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class GoldPriceCell: UITableViewCell {

    @IBOutlet weak var spotPrice: HGSubtitleLabel!
    @IBOutlet weak var buyPrice: HGSubtitleLabel!
    @IBOutlet weak var sellPrice: HGSubtitleLabel!
    @IBOutlet weak var date: HGSubtitleLabel!
    @IBOutlet weak var time: HGSubtitleLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
