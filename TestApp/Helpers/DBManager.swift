//
//  DBManager.swift
//  TestApp
//
//  Created by Akhila Haridas on 16/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit
import CoreData

class DBManager {
    
    static let sharedInstance = DBManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func addImageHistory(nameObj: UserName, pictureObj: Picture) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        entity.fullName = nameObj.getFullName()
        entity.largeImage = pictureObj.large
        entity.thumbImage = pictureObj.thumbnail
        do {
            try context.save()
        } catch {
            print("couldn't save")
        }
        
    }
    
    func clearHistory() -> Bool {
        let context = appDelegate.persistentContainer.viewContext
        let request = User.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try appDelegate.persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: context)
           // userArray?.removeAll()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
