//
//  LoginViewController.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-12.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    fileprivate struct TextFieldType
    {
        static let Email = 0
        static let Password = 1
    }
    
    @IBOutlet weak var emailErrorMsg: UILabel!
    @IBOutlet weak var passwordErrorMsg: HGSubtitleLabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var emailTF: HGLoginTextField!
    @IBOutlet weak var passwordTF: HGLoginTextField! {
        didSet
        {
            passwordTF.rightView = passwordTF.eyes(open: false)
            passwordTF.rightViewMode = .always
        }
    }

    var allFieldsAreValid: Bool = false
    {
        didSet
        {
            continueButton.isEnabled = allFieldsAreValid
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "Create Account"
        
        passwordErrorMsg.text = HGErrorMessage.Strings.errorPassword
        emailErrorMsg.text = HGErrorMessage.Strings.errorEmail
        addHelpButton()
    }
    
    @IBAction func continuePressed(_ sender: Any)
    {
        if allFieldsAreValid
        {
            NetworkManager.shared.registerUserData { (response, error) in
                if (error != nil || response?.result == "error")
                {
                    self.showAlertMessage(message: HGErrorMessage.Strings.errorRegistration)

                    /* Hacking , force success
                    let controller = DashboardViewController()
                    LocalStorage.shared.loggedIn = true
                    self.navigationController?.pushViewController(controller, animated: true)
                    */
                    return
                }

                
                if let res = response
                {
                    let controller = DashboardViewController()
                    LocalStorage.shared.saveUserData(res)
                    LocalStorage.shared.loggedIn = true
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                else
                {
                    self.showAlertMessage(message: HGErrorMessage.Strings.errorRegistration)
                }
            }
        }
    }
    
    private func addHelpButton()
    {
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "help"), style: .plain, target: self, action: #selector(helpButtonPressed))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func updateFields()
    {
        allFieldsAreValid = passwordTF.valid && emailTF.valid
    }
    
    @objc private func helpButtonPressed()
    {
        showAlertMessage(message: "Not available")
    }
    
    func showAlertMessage(message: String)
    {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
        
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
               
                    if HGValidator.shared.isValidEmail(email: validText)
                    {
                        emailErrorMsg.isHidden = true
                        emailTF.valid = true
                        UserData.shared.userEmail = validText
                    }
                    else
                    {
                        emailErrorMsg.isHidden = false
                        emailTF.valid = false
                    }
                    
                case TextFieldType.Password:

                    if HGValidator.shared.isValidPassword(password: validText)
                    {
                        passwordErrorMsg.isHidden = true
                        passwordTF.valid = true
                    }
                    else
                    {
                        passwordErrorMsg.isHidden = false
                        passwordTF.valid = false
                    }

                default:
                    print("Default")
            }
        }
        else
        {
            field.isHidden = false;
            errorMessageLabel.text = HGErrorMessage.Strings.errorEmptyField
        }
        updateFields()
    }
}
