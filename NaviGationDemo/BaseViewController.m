//
//  BaseViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/3/27.
//  Copyright © 2019年 8km. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 统一定义导航栏返回按钮
    self.navigationItem.leftBarButtonItems = @[self.backBarButtonItem];
    
    self.navigationItem.leftBarButtonItems = @[self.backBarButtonItem];
    
    if (self.navigationController.navigationBar) {
        for (UIView *view in self.navigationController.navigationBar.subviews) {
            Class _UIButtonBarStackViewClass = NSClassFromString(@"_UIButtonBarStackView");
            if (_UIButtonBarStackViewClass != nil) {
                if (![view isKindOfClass:_UIButtonBarStackViewClass]) {
                    view.layer.masksToBounds = NO;
                    view.clipsToBounds = NO;
                }
            }
            //
            Class _UITAMICAdaptorViewClass = NSClassFromString(@"_UITAMICAdaptorView");
            if (_UITAMICAdaptorViewClass != nil) {
                if (![view isKindOfClass:_UITAMICAdaptorViewClass]) {
                    view.layer.masksToBounds = NO;
                    view.clipsToBounds = NO;
                }
            }
        }
    }
}

- (UIBarButtonItem *)backBarButtonItem {
    UIImage* backItemImage = [[UIImage imageNamed:@"vhl_nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsBeginImageContextWithOptions(backItemImage.size, NO, backItemImage.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, backItemImage.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, backItemImage.size.width, backItemImage.size.height);
    CGContextClipToMask(context, rect, backItemImage.CGImage);
    [self.navBackButtonColor?:[UIColor whiteColor] setFill];             // **
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    backItemImage = newImage?:backItemImage;

    // 绘制高亮的背景，0.5透明度

    UIGraphicsBeginImageContextWithOptions(backItemImage.size, NO, backItemImage.scale);
    CGContextRef navContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(navContext, 0, backItemImage.size.height);
    CGContextScaleCTM(navContext, 1.0, -1.0);
    CGContextSetBlendMode(navContext, kCGBlendModeNormal);
    CGRect navRect = CGRectMake(0, 0, backItemImage.size.width, backItemImage.size.height);
    CGContextClipToMask(navContext, navRect, backItemImage.CGImage);
    [[self.navBackButtonColor?:[UIColor whiteColor] colorWithAlphaComponent:0.5] setFill];

    CGContextFillRect(navContext, navRect);
    UIImage *hlNewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage* backItemHlImage = hlNewImage?:[[UIImage imageNamed:@"vhl_nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    // -----------------------------------------------------------

    self.navBackButton = [[UIButton alloc] init];
    // 按钮图片
    [self.navBackButton setImage:backItemImage forState:UIControlStateNormal];
    [self.navBackButton setImage:backItemHlImage forState:UIControlStateHighlighted];
    // 按钮字体颜色
    UIColor *titleColor = self.navBackButtonColor?:[UIColor whiteColor];     // ****
    [self.navBackButton setTitleColor:titleColor forState:UIControlStateNormal];
    [self.navBackButton setTitleColor:[titleColor colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    //
    [self.navBackButton setTitle:self.navBackButtonTitle?:@"返回" forState:UIControlStateNormal];
    self.navBackButton.titleLabel.font = [UIFont systemFontOfSize:16];

    self.navBackButton.titleEdgeInsets = UIEdgeInsetsMake(0, -6, 0, 0);     // 图片和字体靠近一点，根据实际情况调整
    self.navBackButton.contentEdgeInsets = UIEdgeInsetsMake(0, -12, 0, 0);
    [self.navBackButton sizeToFit];

    [self.navBackButton addTarget:self action:@selector(navigationItemHandleBack:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.navBackButton];
    backButtonItem.customView.userInteractionEnabled = YES;
    return backButtonItem;
}

- (void)navigationItemHandleBack:(UIButton *)button {
    if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
    }
}
// 设置导航栏返回按钮
- (void)setNavBackButtonTitle:(NSString *)navBackButtonTitle {
    _navBackButtonTitle = navBackButtonTitle;
    self.navigationItem.leftBarButtonItems = @[self.backBarButtonItem];
}
- (void)setNavBackButtonImage:(UIImage *)navBackButtonImage {
    _navBackButtonImage = navBackButtonImage;
    self.navigationItem.leftBarButtonItems = @[self.backBarButtonItem];
}
- (void)setNavBackButtonColor:(UIColor *)navBackButtonColor {
    _navBackButtonColor = navBackButtonColor;
    self.navigationItem.leftBarButtonItems = @[self.backBarButtonItem];
}

//// 支持设备自动旋转
//- (BOOL)shouldAutorotate{
//    return YES;
//}
//// 支持竖屏显示
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskAll;
//}

@end
