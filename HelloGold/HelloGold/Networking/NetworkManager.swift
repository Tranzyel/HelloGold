//
//  NetworkManager.swift
//  HelloGold
//
//  Created by Lam Si Mon on 19-06-12.
//  Copyright © 2019 Lam Si Mon. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import PromiseKit

let baseURL                  = "https://staging.hellogold.com/api/"
let post_registerUserURL     = "v3/users/register.json"
let get_spotPrice            = "v2/spot_price.json"

class NetworkManager: NSObject {

    static let shared = NetworkManager()
    
    private override init() {}

    public func registerUserData(completionHandler: @escaping (_ result: RegisterUserModel?, _ error: Error?) -> Void)
    {
        let params: [String: Any] =
            ["email": UserData.shared.userEmail ?? "",
             "uuid": getUUID(),
             "data": randomString(length: 256),
             "tnc": true
            ]
        
        fetchData(methodURL: post_registerUserURL, params: params, httpMethod: .post, T: RegisterUserModel.self) { (response, error) in
            
            if let model = response as? RegisterUserModel
            {
                LocalStorage.shared.registerUserData = model
                completionHandler(model,nil)
            }
            else
            {
                completionHandler(nil,error)
            }
        }
    }
    
    public func requestGoldPrice(completionHandler: @escaping (_ result: Any?, _ error: Error?) -> Void)
    {
        fetchData(methodURL: get_spotPrice, params: nil, httpMethod: .get, T: SpotPriceModel.self) { (response, error) in
            
            if let model = response as? SpotPriceModel
            {
                LocalStorage.shared.spotPriceData = model
                completionHandler(model,nil)
            }
            
            if let err = error
            {
                completionHandler(nil, err)
            }
        }
    }
    
    internal func fetchData<T: Mappable>(methodURL: String, params: [String: Any]?, httpMethod: HTTPMethod, T: T.Type, completionHandler: @escaping (_ result: Any?, _ error: Error?) -> Void)
    {
        let requestURL = baseURL + methodURL
        Alamofire.request(requestURL, method: httpMethod, parameters: params, encoding: JSONEncoding.default, headers: [:]).responseString { (response) in
            
            switch (response.result)
            {
                case .success(let successResponse):
                    if let mapper = Mapper<T>().map(JSONString: "\(successResponse)")
                    {
                        completionHandler(mapper,nil)
                    }
                
                case .failure(let error):
                    completionHandler(nil,error)
            }
        }
    }
    
    private func getUUID() -> String
    {
        let uuid = UUID().uuidString
        return uuid
    }
    
    private func randomString(length: Int) -> String
    {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map{ _ in letters.randomElement()! })
        
        UserData.shared.userUUID = randomString
        
        return randomString
    }

}


