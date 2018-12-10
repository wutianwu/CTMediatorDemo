//
//  CTMediator+CTMediatorSubActions.m
//  TADemo
//
//  Created by wtw on 12/10/18.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "CTMediator+CTMediatorSubActions.h"

NSString *const kCTMediatorSubTarget = @"Sub";
NSString *const kCTMediatorActionNativeSub1 = @"Sub1";
NSString *const kCTMediatorActionNativeSub2 = @"Sub2";

@implementation CTMediator (CTMediatorSubActions)

- (UIViewController *)CTMediator_Sub1:(NSDictionary *)params {
    return [self performTarget:kCTMediatorSubTarget
                        action:kCTMediatorActionNativeSub1
                        params:params];
}
- (UIViewController *)CTMediator_Sub2:(NSDictionary *)params {
    return [self performTarget:kCTMediatorSubTarget
                        action:kCTMediatorActionNativeSub2
                        params:params];
}

@end
