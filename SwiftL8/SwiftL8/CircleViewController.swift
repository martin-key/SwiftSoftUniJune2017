//
//  CircleViewController.swift
//  SwiftL8
//
//  Created by Martin Kuvandzhiev on 8/2/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit
import MARoundButton

class CircleViewController: UIViewController {

    @IBOutlet weak var button: MARoundButton!
    @IBOutlet weak var circleView: DrawableCircleView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        self.circleView.angle = CGFloat(sender.value)
        self.circleView.setNeedsDisplay()
    }

    @IBAction func roundButtonTapped(_ sender: MARoundButton) {
        sender.borderColor = UIColor.red
    }
    
}
