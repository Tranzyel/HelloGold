//
//  UserProfileHeaderView.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-15.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class UserProfileHeaderView: UIView {

    public class func loadNib() -> UIView
    {
        let nibName = String(describing: UserProfileHeaderView.self)
        
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
