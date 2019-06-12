//
//  HGValidationMessageLabel.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-12.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class HGValidationMessageLabel: UILabel {

    let inset: CGFloat = 8
    
    public override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: inset, left: inset, bottom: inset, right: inset)
        //super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        super.drawText(in: rect.insetBy(dx: insets.left, dy: insets.top))
    }
    
    public override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += inset * 2
        size.height += inset * 2
        return size
    }
}
