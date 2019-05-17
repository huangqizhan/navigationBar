//
//  BaseNaviViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/3/27.
//  Copyright © 2019年 8km. All rights reserved.
//

#import "BaseNaviViewController.h"

@interface BaseNaviViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNaviViewController

- (void)dealloc{
    self.interactivePopGestureRecognizer.delegate = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 重新响应侧滑返回手势
    self.interactivePopGestureRecognizer.delegate = self;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.interactivePopGestureRecognizer.enabled = YES;
}

#pragma mark - 侧滑手势 - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}
// 允许同时响应多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
// 禁止响应手势 是否和ViewController中scrollView跟着滚动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer: (UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
    //return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}
@end
