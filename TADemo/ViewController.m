//
//  ViewController.m
//  TADemo
//
//  Created by wtw on 12/10/18.
//  Copyright © 2018 wtw. All rights reserved.
//

#import "ViewController.h"
#import "CTMediator+CTMediatorSubActions.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *button2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SubMain";
    
    self.button1.frame = CGRectMake(0, 0, 100, 44);
    self.button1.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0 - 44);
    self.button2.frame = CGRectMake(0, 0, 100, 44);
    self.button2.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0 + 44);
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -
#pragma mark - event

- (void)sub1Click {
    UIViewController *viewController = [[CTMediator sharedInstance] CTMediator_Sub1:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)sub2Click {
    UIViewController *viewController = [[CTMediator sharedInstance] CTMediator_Sub2:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma -
#pragma mark - setter getter

- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button1 setTitle:@"跳转sub1" forState:UIControlStateNormal];
        [_button1 setBackgroundColor:[UIColor orangeColor]];
        _button1.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_button1 addTarget:self action:@selector(sub1Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}

- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button2 setTitle:@"跳转sub2" forState:UIControlStateNormal];
        [_button2 setBackgroundColor:[UIColor cyanColor]];
        _button2.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_button2 addTarget:self action:@selector(sub2Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}

@end
