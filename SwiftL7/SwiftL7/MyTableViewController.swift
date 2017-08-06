//
//  MyTableViewController.swift
//  SwiftL7
//
//  Created by Martin Kuvandzhiev on 7/31/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit



class MyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return PresidentData.presidents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCellIdentifier", for: indexPath)
        
        cell.textLabel?.text = PresidentData.presidents[indexPath.row][.name]
        cell.detailTextLabel?.text = PresidentData.presidents[indexPath.row][.years]

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            PresidentData.presidents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let presidentData = PresidentData.presidents[fromIndexPath.row]
        PresidentData.presidents.remove(at: fromIndexPath.row)
        PresidentData.presidents.insert(presidentData, at: to.row)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
    @IBAction func reloadButtonTapped(_ sender: UIBarButtonItem) {
        self.tableView.beginUpdates()
        self.tableView.reloadData()
        self.tableView.endUpdates()
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            
            return
        }
        
        switch segueIdentifier{
        case "presidentDetailsSegueIdetifier":
            
            guard let cell = sender as? UITableViewCell else {
                print("Something's wrong")
                assert(false)
                return
            }
            
            guard let indexPath = self.tableView.indexPath(for: cell) else {
                return
            }
            
            
            (segue.destination as! PresidentDetailsViewController).president = PresidentData.presidents[indexPath.row]
            
        default:
            break
        }
    }
    

}
