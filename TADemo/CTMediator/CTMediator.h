//
//  CTMediator.h
//  TADemo
//
//  Created by wtw on 12/10/18.
//  Copyright © 2018 wtw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTMediator : NSObject

+ (instancetype)sharedInstance;

//本地组件调用
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;
//远程App调用
- (id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *info))completion;

@end
