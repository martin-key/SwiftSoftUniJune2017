//
//  PresidentDetailsViewController.swift
//  SwiftL7
//
//  Created by Martin Kuvandzhiev on 7/31/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit

class PresidentDetailsViewController: UIViewController {
    @IBOutlet weak var presidentImageView: UIImageView!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var yearsOfServiceLabel: UILabel!
    @IBOutlet weak var presidentNameLabel: UILabel!
    
    var president: [PresidentDataType:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presidentNameLabel.text = self.president?[.name]
        self.yearsOfServiceLabel.text = self.president?[.years]
        self.presidentImageView.image =
            UIImage(named: self.president?[.image] ?? "")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let size = self.presidentImageView.bounds.size
        self.presidentImageView.layer.cornerRadius = size.width/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
