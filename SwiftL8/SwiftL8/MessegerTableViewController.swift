//
//  MessegerTableViewController.swift
//  SwiftL8
//
//  Created by Martin Kuvandzhiev on 8/2/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit

class MessegerTableViewController: UITableViewController {

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
        return 5
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        
        cell.profileImageView.image = UIImage(named: "facebookImage.jpg")
        cell.nameLabel.text = "Martin Kuvandzhiev"
        cell.lastMessageLabel.text = "Some text Some text Some text"
        cell.delegate = self
        
        return cell
    }
}

//MARK: - MessageTableViewCellDelegate
extension MessegerTableViewController: MessageTableViewCellDelegate {
    func didPressFavoriteButton(cell: MessageTableViewCell, button: UIButton) {
        button.isSelected = !button.isSelected
    }
}
