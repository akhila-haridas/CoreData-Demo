//
//  User+CoreDataProperties.swift
//  TestApp
//
//  Created by Akhila Haridas on 05/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var thumbImage: String?
    @NSManaged public var largeImage: String?
    

}
