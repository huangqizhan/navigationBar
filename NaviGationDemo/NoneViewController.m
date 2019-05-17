//
//  NoneViewController.m
//  NaviGationDemo
//
//  Created by hjb_mac_mini on 2019/4/12.
//  Copyright © 2019 8km. All rights reserved.
//

#import "NoneViewController.h"
#import "HQNavigation.h"

@interface NoneViewController ()

@end

@implementation NoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIImage *img = [UIImage imageNamed:@"navbg"];
    [self h_setNavBarBackgroundImage:img];
    [self h_setNavBarShadowImageHidden:YES];
    [self h_setNavBarTitleColor:[UIColor whiteColor]];
    [self h_setNavBarTintColor:[UIColor whiteColor]];
    [self h_setIsIgnoreNavBarAnimationTransition:YES];
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
