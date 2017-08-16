//
//  CartTableViewController.swift
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit
import SVProgressHUD

class CartTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocalDataManager.pItemsInCart.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalCell", for: indexPath)
            
            var sum = 0.0
            for item in LocalDataManager.pItemsInCart {
                sum += item.price * Double(item.pcs)
            }
            
            cell.textLabel?.text = "Total"
            cell.detailTextLabel?.text = String(format: "%0.2f", sum)
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as! CartItemTableViewCell
        
        cell.configure(with: LocalDataManager.pItemsInCart[indexPath.row])
        

        return cell
    }
    
    
    
    @IBAction func finalizeButtonTapped(_ sender: UIBarButtonItem) {
        SVProgressHUD.show()
        RequestManager.sendOrder(for: LocalDataManager.pCurrentUser, items: LocalDataManager.pItemsInCart) { (success, statusMessage) in
        DispatchQueue.main.async {
            
            guard success == true, statusMessage == nil else {
                SVProgressHUD.showError(withStatus: statusMessage)
                return
            }
            
            LocalDataManager.pCurrentUser = User()
            LocalDataManager.pItems = [Item]()
            LocalDataManager.initialize()
            
            SVProgressHUD.showSuccess(withStatus: "Items purchased")
            
                self.performSegue(withIdentifier: "OrderSuccessfulSegue", sender: nil)
            }
        }
    }
    
    

}
