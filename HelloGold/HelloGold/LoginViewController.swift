//
//  LoginViewController.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-12.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    fileprivate struct TextFieldType {
        static let Email = 0
        static let Password = 1
    }
    
    @IBOutlet weak var emailErrorMsg: UILabel!
    @IBOutlet weak var passwordErrorMsg: UILabel!
    @IBOutlet weak var emailTF: HGLoginTextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var passwordTF: HGLoginTextField! {
        didSet {
            passwordTF.rightView = passwordTF.eyes(open: false)
            passwordTF.rightViewMode = .always
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        passwordErrorMsg.text = HGErrorMessage.Strings.errorPassword
        emailErrorMsg.text = HGErrorMessage.Strings.errorEmail
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        switch textField.tag
        {
            case TextFieldType.Email:
                print("Begin Email")
            case TextFieldType.Password:
                print("Begin Password")
            default:
                print("Nothing")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        switch textField.tag
        {
            case TextFieldType.Email:
                validate(field: textField, errorMessageLabel: emailErrorMsg, errorMessage: HGErrorMessage.Strings.errorEmail)
            case TextFieldType.Password:
                validate(field: textField, errorMessageLabel: passwordErrorMsg, errorMessage: HGErrorMessage.Strings.errorPassword)
            default:
                print("Nothing")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        switch textField.tag
        {
            case TextFieldType.Email:
                validate(field: textField, errorMessageLabel: emailErrorMsg, errorMessage: HGErrorMessage.Strings.errorEmail)
            case TextFieldType.Password:
                validate(field: textField, errorMessageLabel: passwordErrorMsg, errorMessage: HGErrorMessage.Strings.errorPassword)
            default:
                print("Nothing")
        }
        textField.resignFirstResponder()
        return true
    }
    
    func validate(field: UITextField, errorMessageLabel: UILabel, errorMessage: String)
    {
        if let validText = field.text
        {
            switch field.tag
            {
                case TextFieldType.Email:
               
                    emailErrorMsg.isHidden = HGValidator.shared.isValidEmail(email: validText) ? true : false
                
                case TextFieldType.Password:
                    
                    passwordErrorMsg.isHidden = HGValidator.shared.isValidPassword(password: validText) ? true : false
                
                default:
                    print("Default")
            }
        }
        else
        {
            field.isHidden = false;
            errorMessageLabel.text = HGErrorMessage.Strings.errorEmptyField
        }
    }
}
