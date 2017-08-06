//
//  MessageTableViewCell.swift
//  SwiftL8
//
//  Created by Martin Kuvandzhiev on 8/2/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit

protocol MessageTableViewCellDelegate: class {
    func didPressFavoriteButton(cell: MessageTableViewCell, button: UIButton)
}


class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var loveButton: UIButton!
    
    weak var delegate: MessageTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.height/2
        self.statusView.layer.cornerRadius = self.statusView.bounds.height/2
        
        self.statusView.layer.borderWidth = 1
        self.statusView.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func loveButtonTapped(_ sender: UIButton) {
        self.delegate?.didPressFavoriteButton(cell: self, button: sender)
    }
    
    

}
