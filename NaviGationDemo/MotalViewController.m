//
//  MotalViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/4/12.
//  Copyright © 2019 8km. All rights reserved.
//

#import "MotalViewController.h"
#import "WeChatStyleViewController.h"
#import "HQNavigation.h"
#import "BaseNaviViewController.h"

@interface MotalViewController ()

@end

@implementation MotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self h_setNavBarBackgroundColor:[UIColor colorWithRed:(rand() % 100 * 0.01) green:(rand() % 100 * 0.01) blue:0.86 alpha:1.00]];
    //
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100 + 64, 150, 30)];
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 140 + 64, 150, 30)];
    [button1 setTitle:@"微信样式" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(goFakeNav:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)goFakeNav:(UIButton *)sender {
    WeChatStyleViewController *fakeVC = [[WeChatStyleViewController alloc] init];
    BaseNaviViewController *navVC = [[BaseNaviViewController alloc] initWithRootViewController:fakeVC];
    [self presentViewController:navVC animated:YES completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
