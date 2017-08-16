//
//  ObjCButton.h
//  SwiftL9
//
//  Created by Martin Kuvandzhiev on 8/7/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjCButton : UIButton

@property UIColor * myColor;
@property NSInteger myInt;
@property NSString * myString;

- (void) myFunctionName;
- (NSInteger) aFunctionWithArgument1: (NSInteger) arg1 argument2: (NSInteger) arg2;

// func aFunction(argument1 arg1: Int, argument2 arg2: Int) -> Int


@end
