//
//  Target_Sub.m
//  TADemo
//
//  Created by wtw on 12/10/18.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "Target_Sub.h"
#import "Sub1Controller.h"
#import "Sub2Controller.h"

@implementation Target_Sub

- (id)Action_Sub1:(NSDictionary *)params {
    Sub1Controller *sub1Vc = [[Sub1Controller alloc] init];
    return sub1Vc;
}
- (id)Action_Sub2:(NSDictionary *)params {
    Sub2Controller *sub2Vc = [[Sub2Controller alloc] init];
    return sub2Vc;
}

@end
