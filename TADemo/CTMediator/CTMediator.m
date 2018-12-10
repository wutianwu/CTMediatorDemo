//
//  CTMediator.m
//  TADemo
//
//  Created by wtw on 12/10/18.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "CTMediator.h"

#define APP_SCHEME @"****"

@implementation CTMediator

+ (instancetype)sharedInstance {
    static CTMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[CTMediator alloc] init];
    });
    return mediator;
}

//本地组件调用
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params {
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@",[targetName copy]];
    NSString *actionString = [NSString stringWithFormat:@"Action_%@:",[actionName copy]];
    
    Class targetClass = NSClassFromString(targetClassString);
    id target = [[targetClass alloc] init];
    SEL action = NSSelectorFromString(actionString);
    if (target == nil) {
        return [self performTarget:@"System" action:@"Error" params:@{@"message":@"非法本地调用"}];
    }
    
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
    } else {
        SEL action = NSSelectorFromString(@"NotFound:");
        if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        } else {
            return [self performTarget:@"System" action:@"Error" params:@{@"message":@"非法本地调用"}];
        }
    }
}
//远程App调用
- (id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *info))completion {
    if (![url.scheme isEqualToString:APP_SCHEME]) {
        return [self performTarget:@"System" action:@"Error" params:@{@"message":@"非法远程调用"}];
    }
    
    //配置参数
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *singleParamArr = [param componentsSeparatedByString:@"="];
        if (singleParamArr.count < 2) {
            continue;
        }
        [params setObject:[singleParamArr lastObject] forKey:[singleParamArr firstObject]];
    }
    [params setObject:[url.description copy] forKey:@"goalUrl"];
    
    // 这里这么写主要是出于安全考虑，防止黑客通过远程方式调用本地模块。这里的做法足以应对绝大多数场景，如果要求更加严苛，也可以做更加复杂的安全逻辑。
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) {
        return [self performTarget:@"System" action:@"Error" params:@{@"message":@"非法远程调用"}];
    }
    
    // 这个demo针对URL的路由处理非常简单，就只是取对应的target名字和method名字，但这已经足以应对绝大部份需求。如果需要拓展，可以在这个方法调用之前加入完整的路由逻辑
    id result = [self performTarget:url.host action:actionName params:params];
    if (completion) {
        if (result) {
            completion(@{@"result":result});
        } else {
            completion(nil);
        }
    }
    return result;
}

@end
