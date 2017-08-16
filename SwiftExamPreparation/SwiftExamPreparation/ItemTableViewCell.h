//
//  ItemTableViewCell.h
//  SwiftExamPreparation
//
//  Created by Martin Kuvandzhiev on 8/14/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface ItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

- (void) configureWithItem: (Item *) item;

@end
