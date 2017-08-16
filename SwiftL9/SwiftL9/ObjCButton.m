//
//  ObjCButton.m
//  SwiftL9
//
//  Created by Martin Kuvandzhiev on 8/7/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

#import "ObjCButton.h"
#import "SwiftL9-Swift.h"


@implementation ObjCButton


- (void) layoutSubviews {
    [super layoutSubviews];
    [self aFunctionWithArgument1:10 argument2:20];
    [NSURL URLWithString:@"Object strning"];
    [RequestManager createUserWithUsername:@"username" userdata:@{@"user":@"MyUser"} completion:^(BOOL completion) {
        
    }];
}

- (NSInteger) aFunctionWithArgument1: (NSInteger) arg1 argument2: (NSInteger) arg2 {
    return arg1 + arg2;
}



@end
