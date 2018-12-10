//
//  CTMediator+CTMediatorSubActions.h
//  TADemo
//
//  Created by wtw on 12/10/18.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CTMediator (CTMediatorSubActions)

- (UIViewController *)CTMediator_Sub1:(NSDictionary *)params;
- (UIViewController *)CTMediator_Sub2:(NSDictionary *)params;

@end
