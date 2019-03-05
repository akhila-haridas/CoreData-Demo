//
//  Utilities.swift
//  TestApp
//
//  Created by Akhila Haridas on 23/02/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    static func setViewCornerRadiusAndShadow(view: UIView?) {
        view?.layer.cornerRadius = 6
        view?.layer.shadowOffset = CGSize.zero
        view?.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.3).cgColor
        view?.layer.shadowOpacity = 1
        view?.layer.shadowRadius = 6
    }
    
    static func setViewCornerRadius(view: UIView?) {
        view?.layer.cornerRadius = 6
        view?.layer.masksToBounds = true
    }
}
