//
//  ViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/3/7.
//  Copyright © 2019年 8km. All rights reserved.
//

#import "ViewController.h"
#import "WeChatStyleViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航栏背景图片";
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 60 + 64, 150, 30)];
    [button setTitle:@"微信样式" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(goNest:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)goNest:(UIButton *)sender{
    TestViewController *vc = [TestViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end

