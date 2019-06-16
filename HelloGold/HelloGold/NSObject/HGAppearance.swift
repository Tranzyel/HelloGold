//
//  HGAppearance.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-15.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

public class HGAppearance: NSObject {

    static let shared = HGAppearance()
    
    private struct Colors
    {
        static let backgroundColor = UIColor.black
        static let black =  UIColor.black
        static let gray = UIColor(red:0.77, green:0.77, blue:0.77, alpha:1)
        static let backgroundGray = UIColor(red: 23/255.0, green: 23/255.0, blue: 23/255.0, alpha: 1)
        static let yellow = UIColor(red:0.97, green:0.82, blue:0.27, alpha:1.0)
    }
    
    private struct FontName
    {
        static let futuraLTMediumNormal = "FuturaLT"
        static let futuraLTMediumBold = "FuturaLT-Heavy"
        static let futuraLTBookBold = "FuturaLT-Bold"
        static let futuraPT = "FuturaLT-ExtraBold"
    }
    
    public func setupAppearance()
    {
        setupAppearanceLoginUI()
        setupAppearanceDashboard()
        setupGenericAppearance()
    }
    
    func setupGenericAppearance()
    {
        HGBackgroundView.appearance().backgroundColor = Colors.backgroundGray
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = Colors.yellow
        UINavigationBar.appearance().tintColor = Colors.black
    }
    
    func setupAppearanceLoginUI()
    {
        HGTitleLabel.appearance().font = UIFont(name: FontName.futuraLTMediumBold, size: 20)
        HGSubtitleLabel.appearance().font = UIFont(name: FontName.futuraLTMediumNormal, size: 15)
        
        HGTitleLabel.appearance().textColor = Colors.yellow
        HGSubtitleLabel.appearance().textColor = Colors.gray
    }
    
    func setupAppearanceDashboard()
    {
        HGTitleLabel.appearance().font = UIFont(name: FontName.futuraLTMediumBold, size: 20)
        HGSubtitleLabel.appearance().font = UIFont(name: FontName.futuraLTMediumNormal, size: 15)
        
        HGTitleLabel.appearance().textColor = Colors.yellow
        HGSubtitleLabel.appearance().textColor = Colors.gray
    }
    
    
}
