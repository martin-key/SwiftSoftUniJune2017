//
//  ItemTableViewCell.m
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

#import "ItemTableViewCell.h"
#import "SwiftExamPreparation-Swift.h"


@implementation ItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) configureWithItem: (Item *) item {
    self.itemImageView.image = item.image;
    self.detailsLabel.text = item.SKU;
    self.itemNameLabel.text = item.name;
    self.priceLabel.text = [NSString stringWithFormat:@"%0.2f", item.price];
}



@end
