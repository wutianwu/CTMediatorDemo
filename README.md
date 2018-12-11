# CTMediatorDemo
target-action：组件化

引入CTMediator文件

配置：

Target_Sub.m：

引入：#import "SubController.h"

- (id)Action_Sub:(NSDictionary *)params {
    SubController *subVc = [[SubController alloc] init];
    return subVc;
}

CTMediator+CTMediatorSubActions.m：

NSString *const kCTMediatorSubTarget = @"Sub";
NSString *const kCTMediatorActionNativeSub = @"Sub";

- (UIViewController *)CTMediator_Sub1:(NSDictionary *)params {
    return [self performTarget:kCTMediatorSubTarget
                        action:kCTMediatorActionNativeSub
                        params:params];
}

使用：

UIViewController *viewController = [[CTMediator sharedInstance] CTMediator_Sub:nil];
[self.navigationController pushViewController:viewController animated:YES];
