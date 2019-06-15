//
//  HGLoginTextField.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-12.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class HGLoginTextField: UITextField {
    
    public var valid: Bool = false
    
    func eyes(open: Bool) -> UIButton
    {
        if open
        {
            return openEyesButton()
        }
        return closeEyesButton()
    }
    
    private func getImageView(with image: UIImage?) -> UIImageView
    {
        let squareLength = min(frame.width, frame.height)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: squareLength - 15, height: squareLength - 15)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }

    private func openEyesButton() -> UIButton
    {
        let button = UIButton(type: .custom)
        let imageView = getImageView(with: UIImage(named: "eyeopen"))
        button.setImage(imageView.image, for: .normal)
        button.frame = imageView.frame
        button.addTarget(self, action: #selector(eyesButtonPressed), for: .touchUpInside)
        return button
    }
    
    private func closeEyesButton() -> UIButton
    {
        let button = UIButton(type: .custom)
        let imageView = getImageView(with: UIImage(named: "eyeclose"))
        button.setImage(imageView.image, for: .normal)
        button.frame = imageView.frame
        button.addTarget(self, action: #selector(eyesButtonPressed), for: .touchUpInside)

        return button
    }
    
    @objc private func eyesButtonPressed()
    {
        if isSecureTextEntry
        {
            rightView = eyes(open: true)
        }
        else
        {
            rightView = eyes(open: false)
        }
        
        isSecureTextEntry.toggle()
    }
}
