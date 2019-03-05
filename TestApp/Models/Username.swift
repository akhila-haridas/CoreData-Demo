//
//  Username.swift
//  TestApp
//
//  Created by Akhila Haridas on 23/02/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import Foundation

class UserName {
    var title: String?
    var first: String?
    var last: String?
    
    init(json: [String: Any]) {
        self.title = (json["title"] as? String)?.capitalized
        self.first = (json["first"] as? String)?.capitalized
        self.last = (json["last"] as? String)?.capitalized
    }
    
    func getFullName() -> String? {
        return title! + " " + first! + " " + last!
    }
}
