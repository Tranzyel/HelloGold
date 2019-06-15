//
//  GoldPriceTableHeaderView.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-16.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class GoldPriceTableHeaderView: UIView {
    
    @IBOutlet weak var titleLbl: HGTitleLabel!
    
    public class func loadNib() -> UIView
    {
        let nibName = String(describing: GoldPriceTableHeaderView.self)
        
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
