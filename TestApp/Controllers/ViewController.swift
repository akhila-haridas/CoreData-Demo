//
//  ViewController.swift
//  TestApp
//
//  Created by Akhila Haridas on 23/02/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit
import CoreData
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var userImageView: UIImageView?
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customiseView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func customiseView() {
        Utils.setViewCornerRadiusAndShadow(view: outerView)
        Utils.setViewCornerRadius(view: userImageView)
    }
    
    func addImageHistory(nameObj: UserName, pictureObj: Picture) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRandomImage()
    }
    
    func getRandomImage() {
        activityLoader?.startAnimating()
        APIClient.sharedInstance.fetchDictionaryDataWithGetRequest(requestURL: kApiUrl, headers: [:]) { (error, response) in
            self.activityLoader?.stopAnimating()
            if error == nil {
                if let resultsArray = response?["results"] as? [[String: AnyObject]] {
                    if let firstItem = resultsArray[0] as? [String: AnyObject] {
                        if let usernameDict = firstItem["name"] as? [String: AnyObject] {
                            let nameObj = UserName(json: usernameDict)
                            DispatchQueue.main.async {
                                self.lblName.text = nameObj.getFullName()
                            }
                            if let pictureDict = firstItem["picture"] as? [String: AnyObject] {
                                let pictureObj = Picture(json: pictureDict)
                                self.userImageView?.sd_setImage(with: URL(string: pictureObj.large ?? ""), placeholderImage: nil)
                                self.addImageHistory(nameObj: nameObj, pictureObj: pictureObj)
                            }
                            
                        }
                        
                    }
                }
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    @IBAction func didTapNext(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
           sender.isSelected = !sender.isSelected
            getRandomImage()
        }
    }

    @IBAction func didTapHistory(_ sender: UIBarButtonItem){
        performSegue(withIdentifier: "showHistory", sender: self)
    }

}

