//
//  ViewController.swift
//  SwiftL9
//
//  Created by Martin Kuvandzhiev on 8/7/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit
import SVProgressHUD


class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textFieldData = UserDefaults.standard.string(forKey: "MyTextFieldDataString")
        
        self.textField.text = textFieldData
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("UserAccountCreated"), object: nil, queue: nil) { (notification) in
//            self.view.backgroundColor = UIColor
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(self.textField.text, forKey: "MyTextFieldDataString")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
//        RequestManager.getUsers { (successful, dictData) in
//            print(successful, dictData)
//            
//        }
        
        SVProgressHUD.show()
        RequestManager.createUser(username: "martinkeyyy", userdata: ["Name":"Martin", "Surname":"Kuvandzhiev"]) { (success) in
            switch success {
            case true:
                SVProgressHUD.showSuccess(withStatus: "Success")
            case false:
                SVProgressHUD.showError(withStatus: "Failure :(")
            }
            
            print(success)
        }
        
    }
    
    

}

