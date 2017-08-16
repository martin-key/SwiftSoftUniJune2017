//
//  CartItemTableViewCell.swift
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit

class CartItemTableViewCell: ItemTableViewCell {

    
    override func configure(with item: Item!) {
        self.itemImageView.image = item.image
        self.detailsLabel.text = String(format: "%d pcs", item.pcs)
        self.itemNameLabel.text = item.name
        self.priceLabel.text = String(format: "%0.2f",  Double(item.pcs) * item.price)
    }

}
