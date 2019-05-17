//
//  TestViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/4/11.
//  Copyright © 2019 8km. All rights reserved.
//

#import "TestViewController.h"
#import "HQNavigation.h"


@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ///   h_setIsIgnoreNavBarAnimationTransition
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
