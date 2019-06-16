//
//  UserProfileHeaderView.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-15.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class UserProfileHeaderView: UIView {

    @IBOutlet weak var email: HGSubtitleLabel!
    @IBOutlet weak var accountNumber: HGSubtitleLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let userData = LocalStorage.shared.loadUserData()
        {
            email.text = userData.userEmail
            accountNumber.text = userData.account_number
        }
        
    }
    
    public class func loadNib() -> UIView
    {
        let nibName = String(describing: UserProfileHeaderView.self)
        
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
