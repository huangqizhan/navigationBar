//
//  NaviRootViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/3/27.
//  Copyright © 2019年 8km. All rights reserved.
//

#import "NaviRootViewController.h"
#import "WeChatStyleViewController.h"
#import "ColorGradientViewController.h"
#import "NaviBackImageViewController.h"
#import "HideViewController.h"
#import "NaviAlphaViewController.h"
#import "NaviScrollViewController.h"
#import "TabVcViewController.h"
#import "NoneViewController.h"
#import "HQNavigation.h"


@interface NaviRootViewController ()

@end

@implementation NaviRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航栏背景图片";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIImage *img = [UIImage imageNamed:@"navbg"];
    [self h_setNavBarBackgroundImage:img];
    [self h_setNavBarShadowImageHidden:YES];
    [self h_setNavBarTitleColor:[UIColor whiteColor]];
    [self h_setNavBarTintColor:[UIColor whiteColor]];
//    [self h_setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 60 + 64, 150, 30)];
    [button setTitle:@"微信样式" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(goFake:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100 + 64, 150, 30)];
    [button1 setTitle:@"颜色过渡" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(goTransition:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 140 + 64, 150, 30)];
    [button2 setTitle:@"导航栏背景图片" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(goNavBG:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 180 + 64, 150, 30)];
    [button3 setTitle:@"隐藏导航栏" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button3];
    [button3 addTarget:self action:@selector(goHidden:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(100, 220 + 64, 150, 30)];
    [button4 setTitle:@"导航栏透明度" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button4 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button4];
    [button4 addTarget:self action:@selector(goAlphaNav:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button5 = [[UIButton alloc] initWithFrame:CGRectMake(100, 260 + 64, 150, 30)];
    [button5 setTitle:@"导航栏滚动" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button5 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button5];
    [button5 addTarget:self action:@selector(goScrollNav:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button6 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300 + 64, 150, 30)];
    [button6 setTitle:@"TableVC" forState:UIControlStateNormal];
    [button6 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button6 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button6];
    [button6 addTarget:self action:@selector(goTableViewController:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button7 = [[UIButton alloc] initWithFrame:CGRectMake(100, 340 + 64, 150, 30)];
    [button7 setTitle:@"TableVC" forState:UIControlStateNormal];
    [button7 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button7 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button7];
    [button7 addTarget:self action:@selector(noneAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // --------------------------------------------------------------------------------
    UIView *testview = [[UIView alloc] initWithFrame:CGRectMake(0, -90, 100, 120)];
    testview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testview];
    
    UIView *testview1 = [[UIView alloc] initWithFrame:CGRectMake(100, -90, 100, 120)];
    testview1.backgroundColor = [UIColor redColor];
    [self.view addSubview:testview1];
    
    UIView *testview2 = [[UIView alloc] initWithFrame:CGRectMake(200, -90, 100, 120)];
    testview2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testview2];
    
    UIView *testview3 = [[UIView alloc] initWithFrame:CGRectMake(300, -90, 100, 120)];
    testview3.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:testview3];
}
- (void)goFake:(UIButton *)sender {
    WeChatStyleViewController *vc1 = [[WeChatStyleViewController alloc] init];
    vc1.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc1 animated:YES];
}
- (void)goTransition:(UIButton *)sender {
    ColorGradientViewController *vc2 = [[ColorGradientViewController alloc] init];
    //    [vc2 vhl_setNavBarBackgroundColor:[UIColor colorWithRed:(rand() % 100 * 0.01) green:(rand() % 100 * 0.01) blue:0.86 alpha:1.00]];
    vc2.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc2 animated:YES];
}
- (void)goNavBG:(UIButton *)sender {
    NaviBackImageViewController *vc3 = [[NaviBackImageViewController alloc] init];
    vc3.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc3 animated:YES];
}
- (void)goHidden:(UIButton *)sender {
    HideViewController *vc4 = [[HideViewController alloc] init];
    vc4.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc4 animated:YES];
}
- (void)goAlphaNav:(UIButton *)sender {
    NaviAlphaViewController *vc5 = [[NaviAlphaViewController alloc] init];
    vc5.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc5 animated:YES];
}
- (void)goScrollNav:(UIButton *)sender {
    NaviScrollViewController *vc6 = [[NaviScrollViewController alloc] init];
    vc6.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc6 animated:YES];
}
- (void)goTableViewController:(UIButton *)sender {
    TabVcViewController *vc7 = [[TabVcViewController alloc] init];
    vc7.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc7 animated:YES];
}
- (void)noneAction:(UIButton *)sender{
    NoneViewController *noneVC = [NoneViewController new];
    noneVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noneVC animated:YES];
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
