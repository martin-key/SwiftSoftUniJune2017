//
//  UserDataViewController.swift
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit
import SVProgressHUD

class UserDataViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var companyIDTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // uncommet if using delegate approach
//        self.userIDTextField.delegate = self
//        self.nameTextField.delegate = self
//        self.companyIDTextField.delegate = self
        // Do any additional setup after loading the view.
        
        self.userIDTextField.text = LocalDataManager.pCurrentUser.UID
        self.nameTextField.text = LocalDataManager.pCurrentUser.name
        self.companyIDTextField.text = LocalDataManager.pCurrentUser.companyID
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func executePrimaryAction(for textField: UITextField) {
        switch textField {
        case self.userIDTextField:
            self.nameTextField.becomeFirstResponder()
        case self.nameTextField:
            self.companyIDTextField.becomeFirstResponder()
        case companyIDTextField:
            self.companyIDTextField.resignFirstResponder()
        default:
            break
        }
    }
    
    // Needs delegates to be set in viewDidLoad
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.executePrimaryAction(for: textField)
        return true
    }
    
    @IBAction func returnButtonTapped(_ sender: UITextField) {
        self.executePrimaryAction(for: sender)
    }
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        guard let userID = self.userIDTextField.text, userIDTextField.text?.characters.count ?? 0 > 0 else {
            SVProgressHUD.showError(withStatus: "Empty user ID")
            return
        }
        
        guard let name = self.nameTextField.text else{
            return
        }
        
        let currentUser = User()
        currentUser.UID = userID
        currentUser.name = name
        currentUser.companyID = self.companyIDTextField.text ?? ""
        
        LocalDataManager.pCurrentUser = currentUser
        RequestManager.sendUserInfo(user: currentUser)
    }

}
