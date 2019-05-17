//
//  HideViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/3/27.
//  Copyright © 2019年 8km. All rights reserved.
//

#import "HideViewController.h"
#import "NaviBackImageViewController.h"
#import "NaviAlphaViewController.h"
#import "NaviScrollViewController.h"
#import "TabVcViewController.h"
#import "MotalViewController.h"
#import "WeChatStyleViewController.h"
#import "ColorGradientViewController.h"
#import "HQNavigation.h"
@interface HideViewController ()

@end

@implementation HideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"隐藏导航栏";
    self.view.backgroundColor = [UIColor orangeColor];
    
//    [self h_setStatusBarStyle:UIStatusBarStyleDefault];
    [self h_setNavBarHidden:YES];
    [self h_setStatusBarHidden:YES];
    
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
- (void)goMotalViewController:(UIButton *)sender{
    MotalViewController *motalVC = [MotalViewController new];
    [self presentViewController:motalVC animated:YES completion:^{
        
    }];
}
- (void)motalback:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)motalSystemPhoto:(UIButton *)sender {
    //先确认iOS装置是否有提供访问照片
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        imagePickerController.allowsEditing = YES;      //选择图片是否可以编辑
        //imagePickerController.delegate = self;
        if([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self presentViewController:imagePickerController animated:YES completion:^{
                }];
            }];
        } else {
            [self presentViewController:imagePickerController animated:NO completion:nil];
        }
    }
}
//-(id<UIViewControllerAnimatedTransitioning>)navi
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
