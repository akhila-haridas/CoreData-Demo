//
//  APIClient.swift
//  TestApp
//
//  Created by Akhila Haridas on 23/02/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import Alamofire
import UIKit

class APIClient {
    
static let sharedInstance = APIClient()
    private init(){}

    func fetchDictionaryDataWithGetRequest(requestURL: String, headers: [String: AnyObject], onCompletion: @escaping (NSError?,[String: AnyObject]?) -> Void) -> Void {
    Alamofire.request(requestURL, method: .get)
        .validate()
        .response { (response) in
            let error = response.error
            if error == nil {
                do{
                    let JSON = try JSONSerialization.jsonObject(with: response.data!, options: []) as! [String: AnyObject]

                    onCompletion(nil,JSON)
                } catch let error as NSError {
                    onCompletion(error,nil)
                }
            } else {
                onCompletion(error as NSError?, nil)
            }
    }
        
    }
}
