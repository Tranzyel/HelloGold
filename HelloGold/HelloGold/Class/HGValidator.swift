//
//  HGValidator.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-12.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit

class HGValidator: NSObject {

    public static let shared = HGValidator()

    public func isValidString(string: String) -> Bool
    {
        if string.isEmpty
        {
            return false
        }
        return true
    }
    
    public func isValidEmail(email: String) -> Bool
    {
        let regexPattern = "^[^@]+@([^.]+\\.?){1,2}\\.\\w+$"
        return matchesRegex(forRegex: regexPattern, inputText: email)
    }
    
    public func isValidPassword(password: String) -> Bool
    {
        let regexPattern = "^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z]).{8,}$"
        return matchesRegex(forRegex: regexPattern, inputText: password)
    }
    
    private func matchesRegex(forRegex regexString: String , inputText: String)->Bool
    {
        if isValidString(string: inputText)
        {
            let regexPattern = regexString
            let regex = try! NSRegularExpression(pattern: regexPattern, options: [])
            let range = NSMakeRange(0, inputText.utf16.count)
            let matches = regex.matches(in: inputText, options: [], range: range)
            return matches.count > 0
        }
        return false
    }
}
