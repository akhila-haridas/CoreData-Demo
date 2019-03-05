//
//  Picture.swift
//  TestApp
//
//  Created by Akhila Haridas on 23/02/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import Foundation

class Picture {
    var large: String?
    var medium: String?
    var thumbnail: String?
    
    init(json: [String: Any]) {
        self.large = json["large"] as? String
        self.medium = json["medium"] as? String
        self.thumbnail = json["thumbnail"] as? String
}
}
