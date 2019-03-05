//
//  HistoryViewController.swift
//  TestApp
//
//  Created by Akhila Haridas on 01/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView?
    
    var userArray: [User]? {
        didSet {
            DispatchQueue.main.async {
                self.listTableView?.reloadData()
            }
        }
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getValues()
    }
    
    func getValues() {
        let context = appDelegate.persistentContainer.viewContext
        let request = User.createFetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            userArray = try context.fetch(request)
        } catch {
            print("Failed")
        }
    }
    
    @IBAction func didTapClear(_ sender: UIBarButtonItem) {
        let context = appDelegate.persistentContainer.viewContext
        let request = User.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try appDelegate.persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: context)
            userArray?.removeAll()
        } catch {
            print(error.localizedDescription)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let historyCell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as? HistoryTableViewCell {
            historyCell.userObj = userArray?[indexPath.row]
            return historyCell
        }
        return UITableViewCell()//historyCell
    }
}
