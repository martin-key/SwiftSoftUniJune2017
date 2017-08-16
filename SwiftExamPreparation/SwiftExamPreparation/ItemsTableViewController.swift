//
//  ItemsTableViewController.swift
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit
import SVProgressHUD

class ItemsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocalDataManager.pItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        
        let item = LocalDataManager.pItems[indexPath.row]
        
        //Approach 1
//        cell.itemImageView.image = item.image
//        cell.detailsLabel.text = item.SKU
//        cell.itemNameLabel.text = item.name
//        cell.priceLabel.text = String(format: "%0.2f",  item.price)
        
        //Approach 2
        cell.configure(with: item)


        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var items = LocalDataManager.pItems//
        items[indexPath.row].pcs += 1
        LocalDataManager.pItems = items
        
        SVProgressHUD.showSuccess(withStatus: "Successfuly added to cart")
    }
    
}
