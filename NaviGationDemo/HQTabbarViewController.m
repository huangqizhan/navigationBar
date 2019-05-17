//
//  HQTabbarViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/3/27.
//  Copyright © 2019年 8km. All rights reserved.
//

#import "HQTabbarViewController.h"
#import "BaseNaviViewController.h"
#import "BaseViewController.h"
#import "NaviRootViewController.h"

@interface HQTabbarViewController ()

@end

@implementation HQTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubNavVCs];
}
- (void)setUpSubNavVCs{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i=0; i < 3; i++) {
        NaviRootViewController *bgVC = [[NaviRootViewController alloc] init];
        BaseNaviViewController *navC = [[BaseNaviViewController alloc] initWithRootViewController:bgVC];
        navC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil selectedImage:nil];
        [array addObject:navC];
    }
    self.viewControllers = array;
}
@end
