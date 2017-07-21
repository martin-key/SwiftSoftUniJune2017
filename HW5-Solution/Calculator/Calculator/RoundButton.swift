//
//  RoundButton.swift
//  Calculator
//
//  Created by Martin Kuvandzhiev on 7/21/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 2.0
        self.layer.borderColor = self.tintColor.cgColor
        self.layer.cornerRadius = 5
    }
}
