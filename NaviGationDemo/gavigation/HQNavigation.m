//
//  HQNavigation.m
//  NaviGationDemo
//
//  Created by hqz on 2019/3/7.
//  Copyright © 2019年 8km. All rights reserved.
//

#import "HQNavigation.h"
#import <objc/runtime.h>
#import "sys/utsname.h"

@interface HQNavigation : NSObject
////设置导航栏背景颜色
+ (void)hq_setDefaultNaviBackgroundColor:(UIColor *)color;
+ (UIColor *)hq_defaultNaviBackgroundColor;

///设置导航栏按钮颜色
+ (void)hq_setDefaultNaviBarTintColor:(UIColor *)color;
+ (UIColor *)hq_defaultNaviBarTintColor;

///导航栏标题颜色
+ (void)hq_setDefaultNaviBarTitleColor:(UIColor *)color;
+ (UIColor *)hq_defaultNaviBarTitleColor;


///导航栏黑色分割线是否隐藏
+ (void)hq_setDefaultNaviShadowImageHidden:(BOOL)hidden;
+ (BOOL)hq_defaultNaviShadowImageHidden;


///设置状态栏样式
+ (void)hq_setDefaultStatusBarStyle:(UIStatusBarStyle)style;
+ (UIStatusBarStyle)hq_defaultStatueBarStyle;

///设置状态栏样式
+ (void)hq_setDefaultStatusBarHeight:(CGFloat)height;
+ (CGFloat)hq_defaultStatusBarHeight;


@end
///navigationBar 背景色key
static char kHQDefaultNavBarBarTintColorKey;
///navigationBar 按钮颜色key
static char kHQDefaultNavBarTintColorKey;
///navigationBar 标题颜色key
static char kHQDefaultNavBarTitleColorKey;
///navigationBar 阴影图片是否影藏key
static char kHQDefaultNavBarShadowImageHiddenKey;
///statusBar 样式 key
static char kHQDefaultStatusBarStyleKey;
///statusBar 高度 key
static char kHQDefaultStatusBarHeightKey;


@implementation HQNavigation

///获取过度颜色
+ (UIColor *)middleColor:(UIColor *)fromColor toColor:(UIColor *)toColor percent:(CGFloat)percent{
    CGFloat fromRed = 0;
    CGFloat fromGreen = 0;
    CGFloat fromBlue = 0;
    CGFloat fromAlpha = 0;
    [fromColor getRed:&fromRed green:&fromGreen blue:&fromBlue alpha:&fromAlpha];
    CGFloat toRed = 0;
    CGFloat toGreen = 0;
    CGFloat toBlue = 0;
    CGFloat toAlpha = 0;
    [toColor getRed:&toRed green:&toGreen blue:&toBlue alpha:&toAlpha];
    CGFloat newRed = fromRed + (toRed - fromRed) * percent;
    CGFloat newGreen = fromGreen + (toGreen - fromGreen) * percent;
    CGFloat newBlue = fromBlue + (toBlue - fromBlue) * percent;
    CGFloat newAlpha = fromAlpha + (toAlpha - fromAlpha) * percent;
    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
}

+ (CGFloat)middleAlpha:(CGFloat)fromAlpha toAlpha:(CGFloat)toAlpha percentAlpha:(CGFloat)percent{
    return fromAlpha + (toAlpha - fromAlpha) * percent;
}

+ (BOOL)isiPhoneX {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"]) {
        // judgment by height when in simulators
        return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
                CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)));
    }
    BOOL isIPhoneX = [platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,6"];
    return isIPhoneX;
}
///设置导航栏按钮颜色
+ (void)hq_setDefaultNaviBarTintColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kHQDefaultNavBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (UIColor *)hq_defaultNaviBarTintColor{
    UIColor *color = (UIColor *)objc_getAssociatedObject(self, &kHQDefaultNavBarTintColorKey);
    return color ? color : [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1.0];
}
////设置导航栏背景颜色
+ (void)hq_setDefaultNaviBackgroundColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kHQDefaultNavBarBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (UIColor *)hq_defaultNaviBackgroundColor{
    UIColor *color = (UIColor *)objc_getAssociatedObject(self, &kHQDefaultNavBarBarTintColorKey);
    return color ? color : [UIColor whiteColor];
}

///导航栏标题颜色
+ (void)hq_setDefaultNaviBarTitleColor:(UIColor *)color{
    objc_setAssociatedObject(self, &kHQDefaultNavBarTitleColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (UIColor *)hq_defaultNaviBarTitleColor{
    UIColor *color = objc_getAssociatedObject(self, &kHQDefaultNavBarTitleColorKey);
    return color ? color : [UIColor blackColor];
}

///导航栏黑色分割线是否隐藏
+ (void)hq_setDefaultNaviShadowImageHidden:(BOOL)hidden{
    objc_setAssociatedObject(self, &kHQDefaultNavBarShadowImageHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (BOOL)hq_defaultNaviShadowImageHidden{
    return [objc_getAssociatedObject(self, &kHQDefaultNavBarShadowImageHiddenKey) boolValue];
}

///设置状态栏样式
+ (void)hq_setDefaultStatusBarStyle:(UIStatusBarStyle)style{
    objc_setAssociatedObject(self, &kHQDefaultStatusBarStyleKey, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (UIStatusBarStyle)hq_defaultStatueBarStyle{
    return [objc_getAssociatedObject(self, &kHQDefaultStatusBarStyleKey) integerValue];
}
///设置状态栏样式
+ (void)hq_setDefaultStatusBarHeight:(CGFloat)height{
    objc_setAssociatedObject(self, &kHQDefaultStatusBarHeightKey, @(height), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
+ (CGFloat)hq_defaultStatusBarHeight{
    return [objc_getAssociatedObject(self, &kHQDefaultStatusBarHeightKey) floatValue];
}
@end

/*
 - (NSString *)iphoneName{
 struct utsname systemInfo;
 uname(&systemInfo); // 获取系统设备信息
 NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
 
 NSDictionary *dict = @{
 // iPhone
 @"iPhone5,3" : @"iPhone 5c",
 @"iPhone5,4" : @"iPhone 5c",
 @"iPhone6,1" : @"iPhone 5s",
 @"iPhone6,2" : @"iPhone 5s",
 @"iPhone7,1" : @"iPhone 6 Plus",
 @"iPhone7,2" : @"iPhone 6",
 @"iPhone8,1" : @"iPhone 6s",
 @"iPhone8,2" : @"iPhone 6s Plus",
 @"iPhone8,4" : @"iPhone SE",
 @"iPhone9,1" : @"iPhone 7",
 @"iPhone9,2" : @"iPhone 7 Plus",
 @"iPhone10,1" : @"iPhone 8",
 @"iPhone10,4" : @"iPhone 8",
 @"iPhone10,2" : @"iPhone 8 Plus",
 @"iPhone10,5" : @"iPhone 8 Plus",
 @"iPhone10,3" : @"iPhone X",
 @"iPhone10,6" : @"iPhone X",
 @"iPhone11,2" : @"iPhone XS",
 @"iPhone11,4" : @"iPhone XS Max",
 @"iPhone11,6" : @"iPhone XS Max",
 @"iPhone11,8" : @"iPhone XR",
 @"i386" : @"iPhone Simulator",
 @"x86_64" : @"iPhone Simulator",
 // iPad
 @"iPad4,1" : @"iPad Air",
 @"iPad4,2" : @"iPad Air",
 @"iPad4,3" : @"iPad Air",
 @"iPad5,3" : @"iPad Air 2",
 @"iPad5,4" : @"iPad Air 2",
 @"iPad6,7" : @"iPad Pro 12.9",
 @"iPad6,8" : @"iPad Pro 12.9",
 @"iPad6,3" : @"iPad Pro 9.7",
 @"iPad6,4" : @"iPad Pro 9.7",
 @"iPad6,11" : @"iPad 5",
 @"iPad6,12" : @"iPad 5",
 @"iPad7,1" : @"iPad Pro 12.9 inch 2nd gen",
 @"iPad7,2" : @"iPad Pro 12.9 inch 2nd gen",
 @"iPad7,3" : @"iPad Pro 10.5",
 @"iPad7,4" : @"iPad Pro 10.5",
 @"iPad7,5" : @"iPad 6",
 @"iPad7,6" : @"iPad 6",
 // iPad mini
 @"iPad2,5" : @"iPad mini",
 @"iPad2,6" : @"iPad mini",
 @"iPad2,7" : @"iPad mini",
 @"iPad4,4" : @"iPad mini 2",
 @"iPad4,5" : @"iPad mini 2",
 @"iPad4,6" : @"iPad mini 2",
 @"iPad4,7" : @"iPad mini 3",
 @"iPad4,8" : @"iPad mini 3",
 @"iPad4,9" : @"iPad mini 3",
 @"iPad5,1" : @"iPad mini 4",
 @"iPad5,2" : @"iPad mini 4",
 // Apple Watch
 @"Watch1,1" : @"Apple Watch",
 @"Watch1,2" : @"Apple Watch",
 @"Watch2,6" : @"Apple Watch Series 1",
 @"Watch2,7" : @"Apple Watch Series 1",
 @"Watch2,3" : @"Apple Watch Series 2",
 @"Watch2,4" : @"Apple Watch Series 2",
 @"Watch3,1" : @"Apple Watch Series 3",
 @"Watch3,2" : @"Apple Watch Series 3",
 @"Watch3,3" : @"Apple Watch Series 3",
 @"Watch3,4" : @"Apple Watch Series 3",
 @"Watch4,1" : @"Apple Watch Series 4",
 @"Watch4,2" : @"Apple Watch Series 4",
 @"Watch4,3" : @"Apple Watch Series 4",
 @"Watch4,4" : @"Apple Watch Series 4"
 };
 NSString *name = dict[platform];
 
 return name ? name : platform;
 }
 */
static char kHQBackgroundViewKey;
static char kHQBackgroundImageViewKey;

@implementation UINavigationBar (HQNavigation)

- (UIView *)backGroundView{
    return objc_getAssociatedObject(self, &kHQBackgroundViewKey);
}
- (void)setBackGroundView:(UIView *)view{
    objc_setAssociatedObject(self, &kHQBackgroundViewKey, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImageView *)backGroundImageView{
    return  objc_getAssociatedObject(self, &kHQBackgroundImageViewKey);
}
- (void)setBackGroundImageView:(UIImageView *)imageView{
    objc_setAssociatedObject(self, &kHQBackgroundImageViewKey, imageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)h_setBackGroundView:(UIView *)view{
    [self.backGroundView removeFromSuperview];
    self.backGroundView = nil;
    [self.backGroundImageView removeFromSuperview];
    self.backGroundImageView = nil;
#warning 测试
    // 这里需要将系统添加的模糊层隐藏，不然会在自己添加的背景层再添加一层模糊层
    if ([self.subviews.firstObject subviews].count > 1) {
        UIView *backgroundEffectView = [[self.subviews.firstObject subviews] objectAtIndex:1];// UIVisualEffectView
        if (backgroundEffectView != nil) {
            backgroundEffectView.alpha = 0.0;
        }
    }
    self.backGroundView = view;
    self.backGroundView.frame = self.subviews.firstObject.bounds;
    self.backGroundView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    /** iOS11下导航栏不显示问题 */
    if (self.subviews.count > 0) {
        [self.subviews.firstObject insertSubview:self.backGroundView atIndex:0];
    } else {
        [self insertSubview:self.backGroundView atIndex:0];
    }
}
// -> 设置导航栏背景图片
- (void)h_setBackgroundImage:(UIImage *)image {
    [self.backGroundView removeFromSuperview];
    self.backGroundView = nil;
    
    if (!self.backGroundImageView) {
        // add a image(nil color) to _UIBarBackground make it clear
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.backGroundImageView = [[UIImageView alloc] initWithFrame:self.subviews.firstObject.bounds];
        self.backGroundImageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;  // ****
        // _UIBarBackground is first subView for navigationBar
        /** iOS11下导航栏不显示问题 */
        if (self.subviews.count > 0) {
            [self.subviews.firstObject insertSubview:self.backGroundImageView atIndex:0];
        } else {
            [self insertSubview:self.backGroundImageView atIndex:0];
        }
    }
    self.backGroundImageView.image = image;
}
// -> 设置导航栏背景颜色
- (void)h_setBackgroundColor:(UIColor *)color {
    [self.backGroundImageView removeFromSuperview];
    self.backGroundImageView = nil;
    [self.backGroundView removeFromSuperview];
    self.backGroundView = nil;
    
    if (!self.backGroundView) {
        // add a image(nil color) to _UIBarBackground make it clear
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.backGroundView = [[UIView alloc] initWithFrame:self.subviews.firstObject.bounds];
        self.backGroundView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |
        UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;  // ****
        // _UIBarBackground is first subView for navigationBar
        /** iOS11下导航栏不显示问题 */
        if (self.subviews.count > 0) {
            [self.subviews.firstObject insertSubview:self.backGroundView atIndex:0];
        } else {
            [self insertSubview:self.backGroundView atIndex:0];
        }
    }
    self.backGroundView.backgroundColor = color;
}
///设置导航栏透明度
- (void)h_setBackgroundAlpha:(CGFloat)alpha {
    UIView *barBackgroundView = self.subviews.firstObject;
    barBackgroundView.alpha = alpha;
    
    if (@available(iOS 11.0, *)) {  // iOS11 下 UIBarBackground -> UIView/UIImageViwe
        for (UIView *view in self.subviews) {
            if ([NSStringFromClass([view class]) containsString:@"UIbarBackGround"]) {
                view.alpha = 0;
            }
        }
        // iOS11 下如果不设置 UIBarBackground 下的UIView的透明度，会显示一个白色图层
        if (barBackgroundView.subviews.firstObject) {
            barBackgroundView.subviews.firstObject.alpha = alpha;
        }
    }
    if (self.isTranslucent) {
        if ([barBackgroundView subviews].count > 1) {
            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
    }
}
///设置当前 NavigationBar 底部分割线是否隐藏
- (void)h_setShadowImageHidden:(BOOL)hidden {
    self.shadowImage = hidden ? [UIImage new] : nil;
}
///设置当前 NavigationBar _UINavigationBarBackIndicatorView (默认的返回箭头)是否隐藏
- (void)h_setBarBackIndicatorViewHidden:(BOOL)hidden {
    for (UIView *view in self.subviews) {
        Class _UINavigationBarBackIndicatorViewClass = NSClassFromString(@"_UINavigationBarBackIndicatorView");
        if (_UINavigationBarBackIndicatorViewClass != nil) {
            if ([view isKindOfClass:_UINavigationBarBackIndicatorViewClass]) {
                view.hidden = hidden;
            }
        }
    }
}
///设置导航栏所有 barButtonItem 的透明度
- (void)h_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator {
    for (UIView *view in self.subviews) {
        if (hasSystemBackIndicator == YES) {
            // _UIBarBackground/_UINavigationBarBackground对应的view是系统导航栏，不需要改变其透明度
            Class _UIBarBackgroundClass = NSClassFromString(@"_UIBarBackground");
            if (_UIBarBackgroundClass != nil) {
                if (![view isKindOfClass:_UIBarBackgroundClass]) {
                    view.alpha = alpha;
                }
            }
            Class _UINavigationBarBackground = NSClassFromString(@"_UINavigationBarBackground");
            if (_UINavigationBarBackground != nil) {
                if (![view isKindOfClass:_UINavigationBarBackground]) {
                    view.alpha = alpha;
                }
            }
        } else {
            // 这里如果不做判断的话，会显示 backIndicatorImage
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")] == NO) {
                Class _UIBarBackgroundClass = NSClassFromString(@"_UIBarBackground");
                if (_UIBarBackgroundClass != nil) {
                    if (![view isKindOfClass:_UIBarBackgroundClass]) {
                        view.alpha = alpha;
                    }
                }
                Class _UINavigationBarBackground = NSClassFromString(@"_UINavigationBarBackground");
                if (_UINavigationBarBackground != nil) {
                    if (![view isKindOfClass:_UINavigationBarBackground]) {
                        view.alpha = alpha;
                    }
                }
            }
        }
    }
}
///设置当前 NavigationBar 垂直方向上的平移距离
- (void)h_setTranslationY:(CGFloat)translationY {
    // CGAffineTransformMakeTranslation  平移
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}
///获取当前导航栏垂直方向上偏移了多少
- (CGFloat)h_getTranslationY {
    return self.transform.ty;
}
@end


@interface UIViewController (HQNavigation_Add)

// 设置当前 push 是否完成
- (void)setPushToCurrentVCFinished:(BOOL)isFinished;
// 当前 VC 是否需要添加一个假的NavigationBar
- (BOOL)shouldAddFakeNavigationBar;
@end


@implementation UINavigationController (HQNavigation)
///侧滑时间
static CGFloat HQPopDuration = 0.12;
///侧滑时 display 调用次数
static int HQPopDisPlayCount = 0;

- (CGFloat)hqPopProcess{
    CGFloat all = 60 * HQPopDuration;
    int current = MIN(all, HQPopDisPlayCount);
    return current / all;
}

static CGFloat HQPushDuration = 0.3;
static int HQPushDisPlayCount = 0;
- (CGFloat)hqPushProcess{
    CGFloat all = 60 * HQPushDuration;
    int current = MIN(all, HQPushDisPlayCount);
    return current / all;
}
/// runtime 替换方法
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL needSwizzleSelectors [4] = {
           //监听侧滑手势
            NSSelectorFromString(@"_updateInteractiveTransition:"),
            @selector(pushViewController:animated:),
            @selector(popToRootViewControllerAnimated:),
            @selector(popToViewController:animated:)
        };
        for (int i = 0; i < 4; i++) {
            SEL sel = needSwizzleSelectors[i];
            NSString *newSelectorStr = [[NSString stringWithFormat:@"hq_%@", NSStringFromSelector(sel)] stringByReplacingOccurrencesOfString:@"__" withString:@"_"];
            Method origMethod = class_getInstanceMethod(self, sel);
            Method newMethod = class_getInstanceMethod(self, NSSelectorFromString(newSelectorStr));
            method_exchangeImplementations(origMethod, newMethod);
        }
    });
}
///替换原来监听侧滑过程的方法
- (void)hq_updateInteractiveTransition:(CGFloat)percentComplete{
    
    UIViewController *fromVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextToViewControllerKey];
    [self updateNavigationBarWithFromVC:fromVC toVC:toVC progress:percentComplete];
    ///调用系统的
    [self hq_updateInteractiveTransition:percentComplete];
}
- (void)hq_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    ///push 的时候用 displayLink 刷新导航栏
    __block CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(pushNeedDisplay)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [CATransaction setCompletionBlock:^{
        [displayLink invalidate];
        displayLink = nil;
        HQPushDisPlayCount = 0;
        [viewController setPushToCurrentVCFinished:YES];
    }];
    [CATransaction setAnimationDuration:HQPushDuration];
    [CATransaction begin];
    ///调用系统的
    [self hq_pushViewController:viewController animated:animated];
    [CATransaction commit];
}
- (nullable NSArray<__kindof UIViewController *> *)hq_popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    /// pop的时候的用 displayLink 刷新导航栏
    __block CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(popNeedDisplay)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [CATransaction setCompletionBlock:^{
        [displayLink invalidate];
        displayLink = nil;
        HQPopDisPlayCount = 0;
    }];
    [CATransaction setAnimationDuration:HQPopDuration];
    [CATransaction begin];
    ///调用系统方法
    NSArray<UIViewController *> *vcs =  [self hq_popToViewController:viewController animated:animated];
    [CATransaction commit];
    return vcs;
}
- (nullable NSArray<__kindof UIViewController *> *)hq_popToRootViewControllerAnimated:(BOOL)animated{
    /// pop的时候的用 displayLink 刷新导航栏
    __block CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(popNeedDisplay)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [CATransaction setCompletionBlock:^{
        [displayLink invalidate];
        displayLink = nil;
        HQPopDisPlayCount = 0;
    }];
    [CATransaction setAnimationDuration:HQPopDuration];
    [CATransaction begin];
    ///调用系统方法
    NSArray<UIViewController *> *vcs =  [self hq_popToRootViewControllerAnimated:animated];
    [CATransaction commit];
    return vcs;
}
// pop
- (void)popNeedDisplay {
    if (self.topViewController != nil && self.topViewController.transitionCoordinator != nil) {
        HQPopDisPlayCount += 1;
        CGFloat popProgress = [self hqPopProcess];
        UIViewController *fromVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextToViewControllerKey];
        [self updateNavigationBarWithFromVC:fromVC toVC:toVC progress:popProgress];
    }
}
// push
- (void)pushNeedDisplay {
    if (self.topViewController && self.topViewController.transitionCoordinator != nil) {
        HQPushDisPlayCount += 1;
        CGFloat pushProgress = [self hqPushProcess];
        UIViewController *fromVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIViewController *toVC = [self.topViewController.transitionCoordinator viewControllerForKey:UITransitionContextToViewControllerKey];
        [self updateNavigationBarWithFromVC:fromVC toVC:toVC progress:pushProgress];
    }
}
/* 根据进度 更新导航栏 */
- (BOOL)updateNavigationBarWithFromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC progress:(CGFloat)progress{
    ///如果影藏 不用更新
    if ([fromVC h_navBarHidden] || [toVC h_navBarHidden]) {
        return NO;
    }
    ///如果设置了背景图片  不用更新
    if ([fromVC h_navBarBackgroundImage] || [toVC h_navBarBackgroundImage]) {
        return NO;
    }
    ///如果设置了切换样式  不用更新
    if ([fromVC h_navigationSwitchStyle] == 1 || [toVC h_navigationSwitchStyle] == 1) {
        return NO;
    }
    if ([fromVC h_navBarBackgroundAlpha] != [toVC h_navBarBackgroundAlpha]) {
        return NO;
    }
    ///颜色过度
    {
        /// 标题颜色
        UIColor *fromTitleColor = [fromVC h_navBarTitleColor];
        UIColor *toTitleColor = [toVC h_navBarTitleColor];
        UIColor *newTitleColor = [HQNavigation middleColor:fromTitleColor toColor:toTitleColor percent:progress];
        [self setNeedsNavigationBarUpdateForTitleColor:newTitleColor];
        
        ///导航栏按钮颜色
        UIColor *fromTintColor = [fromVC h_navBarTintColor];
        UIColor *toTintColor = [toVC h_navBarTintColor];
        UIColor *newTintColor = [HQNavigation middleColor:fromTintColor toColor:toTintColor percent:progress];
        [self setNeedsNavigationBarUpdateForTintColor:newTintColor];
        
        ///导航栏背景颜色
        UIColor *fromBarTintColor = [fromVC h_navBarBackgroundColor];
        UIColor *toBarTintColor = [toVC h_navBarBackgroundColor];
        UIColor *newbarTintColor = [HQNavigation middleColor:fromBarTintColor toColor:toBarTintColor percent:progress];
        [self setNeedsNavigationBarUpdateForBarTintColor:newbarTintColor];
    }
    return YES;
}

#pragma mark - deal the gesture of return
// 导航栏返回按钮点击
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    ///手势交互协调器
    id <UIViewControllerTransitionCoordinator> coor = [self.topViewController transitionCoordinator ];
    //如果创建了转场交互手势处理
    if ([coor initiallyInteractive]) {
        NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
        __weak typeof(self) weakSelf = self;
        if ([sysVersion floatValue] >= 10) {
            ///处理交互手势
            if (@available(iOS 10.0, *)) {
                [coor notifyWhenInteractionChangesUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
                    __strong typeof (self) pThis = weakSelf;
                    [pThis dealInteractionChanges:context];
                }];
            }
        } else {
            [coor notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
                __strong typeof (self) pThis = weakSelf;
                [pThis dealInteractionChanges:context];
            }];
        }
    }
    return YES;
}
///处理手势交互
- (void)dealInteractionChanges:(id<UIViewControllerTransitionCoordinatorContext>)context{
    void (^animation)(UITransitionContextViewControllerKey) = ^(UITransitionContextViewControllerKey key){
        if (![self.topViewController shouldAddFakeNavigationBar]) {
            UIColor *curColor = [[context viewControllerForKey:key] h_navBarBackgroundColor];
            CGFloat curAlpha = [[context viewControllerForKey:key] h_navBarBackgroundAlpha];
            UIViewController *vc = [context viewControllerForKey:key];
            UIImage *bgImage = [vc h_navBarBackgroundImage];
            UIView *bgView = [[context viewControllerForKey:key] h_navBarBackgroundView];
            UIColor *tintColor = [[context viewControllerForKey:key] h_navBarTintColor];
            UIColor *titleColor = [[context viewControllerForKey:key] h_navBarTitleColor];
            [self setNeedsNavigationBarUpdateForBarTintColor:curColor];
            [self setNeedsNavigationBarUpdateForBarBackgroundAlpha:curAlpha];
            [self setNeedsNavigationBarUpdateForBarBackgroundImage:bgImage];
            [self setNeedsNavigationBarUpdateForBarBackgroundView:bgView];
            [self setNeedsNavigationBarUpdateForTintColor:tintColor];
            [self setNeedsNavigationBarUpdateForTitleColor:titleColor];
            
        }
    };
    ///如果已经取消手势
    if ([context isCancelled]) {
        NSTimeInterval dutation = [context transitionDuration] * context.percentComplete;
        [UIView animateWithDuration:dutation animations:^{
            animation(UITransitionContextFromViewKey);
        }];
    }else{
        NSTimeInterval dutation = [context transitionDuration] * context.percentComplete;
        [UIView animateWithDuration:dutation animations:^{
            animation(UITransitionContextToViewKey);
        }];
    }
    
}
#pragma mark - setter
// -> 设置当前导航栏需要改变导航栏背景透明度
- (void)setNeedsNavigationBarUpdateForBarBackgroundAlpha:(CGFloat)barBackgroundAlpha {
    [self.navigationBar h_setBackgroundAlpha:barBackgroundAlpha];
}
// -> 设置当前导航栏的背景View
- (void)setNeedsNavigationBarUpdateForBarBackgroundView:(UIView *)backgroundView {
    [self.navigationBar h_setBackGroundView:backgroundView];
}

// -> 设置当前导航栏背景图片
- (void)setNeedsNavigationBarUpdateForBarBackgroundImage:(UIImage *)backgroundImage {
    [self.navigationBar h_setBackgroundImage:backgroundImage];
}
// -> 设置当前导航栏 barTintColor | 导航栏背景颜色
- (void)setNeedsNavigationBarUpdateForBarTintColor:(UIColor *)barTintColor {
    [self.navigationBar h_setBackgroundColor:barTintColor];
}
// -> 设置当前导航栏的 TintColor | 按钮颜色
- (void)setNeedsNavigationBarUpdateForTintColor:(UIColor *)tintColor {
    self.navigationBar.tintColor = tintColor;
}
// -> 设置当前导航栏 titleColor | 标题颜色
- (void)setNeedsNavigationBarUpdateForTitleColor:(UIColor *)titleColor {
    NSDictionary *titleTextAttributes = [self.navigationBar titleTextAttributes];
    if (titleTextAttributes == nil) {
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:titleColor};
        return;
    }
    NSMutableDictionary *newTitleTextAttributes = [titleTextAttributes mutableCopy];
    newTitleTextAttributes[NSForegroundColorAttributeName] = titleColor;
    self.navigationBar.titleTextAttributes = newTitleTextAttributes;
}
// -> 设置当前导航栏 shadowImageHidden
- (void)setNeedsNavigationBarUpdateForShadowImageHidden:(BOOL)hidden {
    self.navigationBar.shadowImage = hidden ? [UIImage new] : nil;
}

@end



@implementation UIViewController (HQNavigation)

// 跳转到当控制器前是否完成
static char kHQPushToCurrentVCFinishedKey;
// 跳转到下一个控制器是否完成
static char kHQPushToNextVCFinishedKey;
// 当前导航栏切换样式
static char kHQNavSwitchStyleKey;
// 当前导航栏是否隐藏
static char kHQNavBarHiddenKey;
// 当前导航栏背景视图
static char kHQNavBarBackgroundViewKey;
// 当前导航栏背景图片
static char kHQNavBarBackgroundImageKey;
// 当前导航栏背景颜色
static char kHQNavBarBackgroundColorKey;
// 当前导航栏背景透明度
static char kHQNavBarBackgroundAlphaKey;
// 当前导航栏按钮颜色
static char kHQNavBarTintColorKey;
// 当前导航栏标题颜色
static char kHQNavBarTitleColorKey;
// 当前导航栏底部黑线是否隐藏
static char kHQNavBarShadowImageHiddenKey;
// 当前导航栏浮动高度Y
static char kHQNavBarTranslationYKey;
// 当前状态栏是否隐藏
static char kHQStatusBarHiddenKey;
// 当前导航栏状态栏样式
//static char kHQStatusBarStyleKey;
// 假的导航栏，实现两种颜色导航栏
static char kHQFakeNavigationBarKey;
// 用于放在 view 最底部，避免切换时显示了下一个 view
static char kHQTempBackViewKey;
///是否添加导航栏的过度效果
static char kHQAnimationTransitionKey;
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL needSwizzeSelctors [4] = {
            @selector(viewWillAppear:),
            @selector(viewDidAppear:),
            @selector(viewWillDisappear:),
            @selector(viewDidDisappear:)
            
        };
        for (int i = 0; i < 4; i++) {
            SEL originSelector = needSwizzeSelctors[i];
            
            Method orighMethod = class_getInstanceMethod(self, originSelector);
            Method swizzMethod = class_getInstanceMethod(self, NSSelectorFromString([NSString stringWithFormat:@"hq_%@",NSStringFromSelector(originSelector)]));
            method_exchangeImplementations(orighMethod, swizzMethod);
        }
    });
}
- (void)hq_viewWillAppear:(BOOL)animated{
    if ([self canUpdateNavigationBar]) {
        [self setPushToNextVCFinished:NO];
        ///如果导航栈只有一个 不用显示返回按钮
        if (self.navigationController.viewControllers.count == 1) {
            [self.navigationController.navigationBar h_setBarBackIndicatorViewHidden:YES];
        }else{
            [self.navigationController.navigationBar h_setBarBackIndicatorViewHidden:NO];
        }
        ///是否更新状态栏
        if ([self isStatusBarDiff]) {
            [self h_setStatusBarHidden:NO];
            [self setNeedsStatusBarAppearanceUpdate];
        }
        ///是否更新导航栏
        [self.navigationController setNavigationBarHidden:[self h_navBarHidden] animated:YES];
        ///恢复导航栏的偏移量
        if ([self h_navBarTranslationY] > 0 ) {
            [self h_setNavBarTranslationY:0.0];
        }
        ///是否隐藏导航栏
        [self.navigationController setNavigationBarHidden:[self h_navBarHidden] animated:YES];
        ///如果导航栏有向上偏移 回复到原来的大小
        if ([self h_navBarTranslationY] > 0) {
            [self h_setNavBarTranslationY:0.0];
        }
        if ([self shouldAddFakeNavigationBar]) {
            [self addFakeNavigationBar];
        }
        
        ///跟新导航栏信息
        if (![self h_navBarHidden]) {
            if (![self hq_fakeNavigationBar] && (![self isTransitionStyle] || [self isMotal] || [self isRootViewController])) {
                if ([self h_navBarBackgroundView]) {
                    [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundView:self.h_navBarBackgroundView];
                }else if ([self h_navBarBackgroundImage]){
                    [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundImage:self.h_navBarBackgroundImage];
                }else{
                    [self.navigationController setNeedsNavigationBarUpdateForBarTintColor:self.h_navBarBackgroundColor];
                }
            }
            [self.navigationController setNeedsNavigationBarUpdateForTintColor:self.h_navBarTintColor];
            [self.navigationController setNeedsNavigationBarUpdateForTitleColor:self.h_navBarTitleColor];
        }
    }
    ///调用系统
    [self hq_viewWillAppear:animated];
}
- (void)hq_viewDidAppear:(BOOL)animated{
    if ([self isRootViewController] == NO) {
        self.pushToCurrentVCFinished = YES;
    }
    if ([self canUpdateNavigationBar]) {
        [self h_setNavBarTranslationY:0.0];
        [self.navigationController setNavigationBarHidden:[self h_navBarHidden] animated:YES];
        [self removeFakeNavigationBar];
        [self updateNavigationInfo];
        [HQNavigation hq_setDefaultStatusBarHeight:[self h_statusBarHeight]];
    }
    ///调用系统
    [self hq_viewDidAppear:animated];
}
- (void)hq_viewWillDisappear:(BOOL)animated{
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:[self h_navBarHidden] animated:YES];
        if ([self h_navBarTranslationY] > 0.0) {
            [self h_setNavBarTranslationY:0.0];
        }
        
        ///跟新导航栏信息
        if (![self h_navBarHidden]) {
            [self.navigationController setNeedsNavigationBarUpdateForTintColor:[self h_navBarTintColor]];
            [self.navigationController setNeedsNavigationBarUpdateForTitleColor:[self h_navBarTitleColor]];
            [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundAlpha:[self h_navBarBackgroundAlpha]];
        }
        [self setPushToNextVCFinished:YES];
    }
    ///调用系统
    [self hq_viewWillDisappear:animated];
}
- (void)hq_viewDidDisappear:(BOOL)animated{
    [self removeFakeNavigationBar];
    [self h_setNavBarTranslationY:0.0];
    ///调用系统
    [self hq_viewDidDisappear:animated];
}

- (void)updateNavigationInfo{
    if ([self h_navBarHidden]) {
        return;
    }
    if (![self hq_fakeNavigationBar]) {
        if ([self h_navBarBackgroundView]) {
            [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundView:self.h_navBarBackgroundView];
        }else if ([self h_navBarBackgroundImage]){
            [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundImage:self.h_navBarBackgroundImage];
        }else{
            [self.navigationController setNeedsNavigationBarUpdateForBarTintColor:self.h_navBarBackgroundColor];
        }
    }
    [self.navigationController setNeedsNavigationBarUpdateForTintColor:[self h_navBarTintColor]];
    [self.navigationController setNeedsNavigationBarUpdateForTitleColor:[self h_navBarTitleColor]];
    [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundAlpha:[self h_navBarBackgroundAlpha]];
    [self.navigationController setNeedsNavigationBarUpdateForShadowImageHidden:[self h_navBarShadowImageHidden]];
    [self h_setNavBarTranslationY:[self h_navBarTranslationY]];
}
#pragma mark ---- private --
- (UIViewController *)fromVC{
    return [self.navigationController.transitionCoordinator viewControllerForKey:UITransitionContextFromViewControllerKey];
}
- (UIViewController *)toVC{
    return [self.navigationController.transitionCoordinator viewControllerForKey:UITransitionContextToViewControllerKey];
}
/// fromVC & toVC  状态栏是否b不同
- (BOOL)isStatusBarDiff{
    UIViewController *fromVC = [self fromVC];
    UIViewController *toVC = [self toVC];
//    return  ([fromVC h_statusBarHidden] != [toVC h_statusBarHidden]);
    CGFloat statusBarHeight = [HQNavigation hq_defaultStatusBarHeight];
    BOOL needChangeFromNavBarFrame = (![fromVC h_statusBarHidden] && [toVC h_statusBarHidden]);
    BOOL heightEqual = [fromVC h_navigationBarAndStatusBarHeight] == [fromVC h_navgationBarHeight];
    
    return (needChangeFromNavBarFrame && heightEqual && statusBarHeight > 0 && [toVC h_navBarHidden]);
}
// 是否都是颜色渐变过渡
- (BOOL)isTransitionStyle {
    UIViewController *fromVC = [self fromVC];
    UIViewController *toVC = [self toVC];
    // 如果 VC 中有隐藏了导航栏的就不做切换效果
    if ([fromVC h_navBarHidden] || [toVC h_navBarHidden]) {
        return NO;
    }
    // 如果 VC 中设置了自定义导航栏图片
    if (([fromVC h_navBarBackgroundImage] || [toVC h_navBarBackgroundImage])) {
        return NO;
    }
    // 如果 VC 中设置了切换样式为两种导航栏
    if ([fromVC h_navigationSwitchStyle] == 1 || [toVC h_navigationSwitchStyle] == 1) {
        return NO;
    }
    // 如果 VC 中两个导航栏的透明度不一样，也使用假的导航栏
    if ([fromVC h_navBarBackgroundAlpha] != [toVC h_navBarBackgroundAlpha]) {
        return NO;
    }
    return YES;
}
// 判断当前是否是模态跳转
- (BOOL)isMotal {
    UIViewController *toVC = [self toVC];
    if ([toVC isKindOfClass:[UINavigationController class]]) {
        return YES;
    }
    return NO;
}
// 判断当前是否是第一个视图
- (BOOL)isRootViewController {
    UIViewController *rootViewController = self.navigationController.viewControllers.firstObject;
    if ([rootViewController isKindOfClass:[UITabBarController class]] == NO) {
        return rootViewController == self;
    } else {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [tabBarController.viewControllers containsObject:self];
    }
}
/*
  导航控制器的navigationBar 默认是在当前ViewController.view 的上层上的 当push 或者 pop 的时候 presentingViewController & presentedViewController 的视图是在导航栏下面的   为了在过度的过程中有流畅过度效果 故在动画过程中添加一个假的导航栏 原生导航栏的透明度变为0   动画结束之后移除假的导航栏 恢复导航栏的透明度 
 */
// 是否需要添加一个假的 NavigationBar
- (BOOL)shouldAddFakeNavigationBar{
    UIViewController *fromVC = [self fromVC];
    UIViewController *toVC = [self toVC];
    if ([fromVC h_isIgnorenavBarAnimationTransition] || [toVC h_isIgnorenavBarAnimationTransition]) {
        return NO;
    }
    // 判断当前导航栏交互的两个VC其中是否设置了导航栏样式为两种颜色导航栏，或者设置了导航栏背景图片，或者透明度不一致(用过渡不好看..)
    if ((fromVC && ([fromVC h_navigationSwitchStyle] == 1 || [fromVC h_navBarBackgroundImage])) ||
        (toVC && ([toVC h_navigationSwitchStyle] == 1 || [toVC h_navBarBackgroundImage])) ||
        [fromVC h_navBarHidden] != [toVC h_navBarHidden] ||
        [fromVC h_navBarBackgroundAlpha] != [toVC h_navBarBackgroundAlpha]) {
        return YES;
    }
    return NO;
}
- (BOOL)canUpdateNavigationBar {
    // 如果当前有导航栏，且当前是全屏，//且没有手动设置隐藏导航栏
    if (self.navigationController && [self.navigationController.viewControllers containsObject:self]) {
        return YES;
    }
    return NO;
}
///添加假的导航栏
- (void)addFakeNavigationBar{
    UIViewController *fromVC = [self fromVC];
    UIViewController *toVC = [self toVC];
    [fromVC removeFakeNavigationBar];
    [toVC removeFakeNavigationBar];
    
    ///假的navigationBar == nil && 没有隐藏导航栏  需要添加一个假的导航栏 用于做过度效果
    if (!fromVC.hq_fakeNavigationBar && ![fromVC h_navBarHidden]) {
        CGRect fakeNaviFrame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), [self h_navigationBarAndStatusBarHeight]);
        // 2. 判断当前 vc 是否是 UITableViewController 或 UICollectionViewController , 因为这种 vc.view 会为 scrollview
        // ** 虽然 view frame 为全屏开始，但是因为安全区域，使得内容视图在导航栏下面 **
        // ** 千万不要再设置 edgesForExtendedLayout 为 None，因为 tableview 默认开启了 clipsToBounds 会使得添加的导航栏失效 **
        if ([fromVC.view isKindOfClass:[UIScrollView class]] || fromVC.edgesForExtendedLayout == UIRectEdgeNone) {
            fakeNaviFrame = [fromVC.view convertRect:fakeNaviFrame fromView:self.navigationController.view];
        }
        fromVC.hq_fakeNavigationBar = [[UIImageView alloc] initWithFrame:fakeNaviFrame];
        if (fromVC.h_navBarBackgroundView) {
            fromVC.h_navBarBackgroundView.backgroundColor = [UIColor clearColor];
            UIView *backView = fromVC.h_navBarBackgroundView;
            backView.frame = fromVC.hq_fakeNavigationBar.bounds;
            [fromVC.hq_fakeNavigationBar addSubview:backView];
        }else{
            fromVC.hq_fakeNavigationBar.backgroundColor = [fromVC h_navBarBackgroundColor];
            fromVC.hq_fakeNavigationBar.image = [fromVC h_navBarBackgroundImage];
        }
        fromVC.hq_fakeNavigationBar.alpha = [fromVC h_navBarBackgroundAlpha];
        [fromVC.view addSubview:fromVC.hq_fakeNavigationBar];
        [fromVC.view bringSubviewToFront:fromVC.hq_fakeNavigationBar];
        /// 设置导航栏的透明度0
        [fromVC.navigationController setNeedsNavigationBarUpdateForBarBackgroundAlpha:0];
        // - 当从有状态栏切换到无状态栏时，会出现一个当前 vc 显示了底部 vc 的内容，这里增加一个 view 用于遮盖
        // temp background view
        CGRect tempviewFrame = fakeNaviFrame;
        tempviewFrame.size.height = tempviewFrame.size.height + [HQNavigation hq_defaultStatusBarHeight]?:20.0f;
        fromVC.hq_tempBackView = [[UIView alloc] initWithFrame:tempviewFrame];
        fromVC.hq_tempBackView.backgroundColor = fromVC.view.backgroundColor;
        [fromVC.view addSubview:fromVC.hq_tempBackView];
        [fromVC.view sendSubviewToBack:fromVC.hq_tempBackView];
    }
    
    ////toVC   fakeNavigationBar
    if (!toVC.hq_fakeNavigationBar && ![toVC h_navBarHidden]) {
        CGRect fakeNaviFrame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), [self h_navigationBarAndStatusBarHeight]);
        if (toVC.edgesForExtendedLayout == UIRectEdgeNone) {
            fakeNaviFrame = CGRectMake(0, -[fromVC h_navigationBarAndStatusBarHeight], CGRectGetWidth(self.view.bounds), [self h_navigationBarAndStatusBarHeight]);
        }
        
        if ([toVC.view isKindOfClass:[UIScrollView class]]) {
            fakeNaviFrame = [toVC.view convertRect:fakeNaviFrame fromView:toVC.navigationController.view];
            CGPoint offset = ((UIScrollView *)toVC.view).contentOffset;
            if (offset.y == 0) {
                fakeNaviFrame = CGRectMake(fakeNaviFrame.origin.x, fakeNaviFrame.origin.y -[self h_navigationBarAndStatusBarHeight], fakeNaviFrame.size.width, fakeNaviFrame.size.height);
            }
        }
        //
        toVC.hq_fakeNavigationBar = [[UIImageView alloc] initWithFrame:fakeNaviFrame];
        if ([toVC h_navBarBackgroundView]) {
            toVC.hq_fakeNavigationBar.backgroundColor = [UIColor clearColor];
            UIView *view = [toVC h_navBarBackgroundView];
            view.frame = CGRectMake(0, 0, fakeNaviFrame.size.width,fakeNaviFrame.size.height);
            [toVC.hq_fakeNavigationBar addSubview:view];
        } else {
            toVC.hq_fakeNavigationBar.backgroundColor = [toVC h_navBarBackgroundColor];
            toVC.hq_fakeNavigationBar.image = [toVC h_navBarBackgroundImage];
        }
        toVC.hq_fakeNavigationBar.alpha = [toVC h_navBarBackgroundAlpha];
        [toVC.view addSubview:toVC.hq_fakeNavigationBar];
        [toVC.view bringSubviewToFront:toVC.hq_fakeNavigationBar];
        // 隐藏系统导航栏背景
        [toVC.navigationController setNeedsNavigationBarUpdateForBarBackgroundAlpha:0.0f];
    }
}
/// 移除假的导航栏
- (void)removeFakeNavigationBar{
    if (self.hq_fakeNavigationBar) {
        [self.hq_fakeNavigationBar removeFromSuperview];
        self.hq_fakeNavigationBar = nil;
    }
    if (self.hq_tempBackView) {
        [self.hq_tempBackView removeFromSuperview];
        self.hq_tempBackView = nil;
    }
}
/*假的导航栏 */
- (UIImageView *)hq_fakeNavigationBar {
    return (UIImageView *)objc_getAssociatedObject(self, &kHQFakeNavigationBarKey);
}
- (void)setHq_fakeNavigationBar:(UIImageView *)navigationBar {
    objc_setAssociatedObject(self, &kHQFakeNavigationBarKey, navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)hq_tempBackView {
    return (UIView *)objc_getAssociatedObject(self, &kHQTempBackViewKey);
}
- (void)setHq_tempBackView:(UIView *)tempbackview {
    objc_setAssociatedObject(self, &kHQTempBackViewKey, tempbackview, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/** 回到当前VC是否完成*/
- (void)setPushToCurrentVCFinished:(BOOL)isFinished {
    objc_setAssociatedObject(self, &kHQPushToCurrentVCFinishedKey, @(isFinished), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)pushToCurrentVCFinished {
    id isFinished = objc_getAssociatedObject(self, &kHQPushToCurrentVCFinishedKey);
    return (isFinished != nil) ? [isFinished boolValue] : NO;
}
/** 跳转到下个VC是否完成*/
- (void)setPushToNextVCFinished:(BOOL)isFinished {
    objc_setAssociatedObject(self, &kHQPushToNextVCFinishedKey, @(isFinished), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)pushToNextVCFinished {
    id isFinished = objc_getAssociatedObject(self, &kHQPushToNextVCFinishedKey);
    return (isFinished != nil) ? [isFinished boolValue] : NO;
}

#pragma mark  ---- public method
- (void)h_setNavigationSwitchStyle:(HQNavigationSwitchStyle)style{
    objc_setAssociatedObject(self, &kHQNavSwitchStyleKey, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (HQNavigationSwitchStyle )h_navigationSwitchStyle{
    id style = objc_getAssociatedObject(self, &kHQNavSwitchStyleKey);
    return style?[style integerValue]:0;
}
/** 设置隐藏当前导航栏*/
- (void)h_setNavBarHidden:(BOOL)hidden {
    objc_setAssociatedObject(self, &kHQNavBarHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)h_navBarHidden {
    id hidden = objc_getAssociatedObject(self, &kHQNavBarHiddenKey);
    return hidden?[hidden boolValue]:NO;
}
/** 1.设置当前导航栏的背景View*/
- (void)h_setNavBarBackgroundView:(UIView *)view {
    objc_setAssociatedObject(self, &kHQNavBarBackgroundViewKey, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)h_navBarBackgroundView {
    UIView *view = (UIView *)objc_getAssociatedObject(self, &kHQNavBarBackgroundViewKey);
    return view?: nil;
}
/** 2.设置当前导航栏的背景图片*/
- (void)h_setNavBarBackgroundImage:(UIImage *)image {
    objc_setAssociatedObject(self, &kHQNavBarBackgroundImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImage *)h_navBarBackgroundImage {
    UIImage *image = (UIImage *)objc_getAssociatedObject(self, &kHQNavBarBackgroundImageKey);
    return image?: nil;
}
/** 3.设置当前导航栏 barTintColor(导航栏背景颜色)*/
- (void)h_setNavBarBackgroundColor:(UIColor *)color {
    objc_setAssociatedObject(self, &kHQNavBarBackgroundColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self pushToCurrentVCFinished] && ![self pushToNextVCFinished]) {
        [self.navigationController setNeedsNavigationBarUpdateForBarTintColor:color];
    }
}
- (UIColor *)h_navBarBackgroundColor {
    UIColor *barTintColor = (UIColor *)objc_getAssociatedObject(self, &kHQNavBarBackgroundColorKey);
    return (barTintColor != nil) ? barTintColor : [HQNavigation hq_defaultNaviBackgroundColor];
}
/** 当前导航栏的透明度*/
- (void)h_setNavBarBackgroundAlpha:(CGFloat)alpha {
    objc_setAssociatedObject(self, &kHQNavBarBackgroundAlphaKey, @(alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController setNeedsNavigationBarUpdateForBarBackgroundAlpha:alpha];
}
- (CGFloat)h_navBarBackgroundAlpha {
    id barBackgroundAlpha = objc_getAssociatedObject(self, &kHQNavBarBackgroundAlphaKey);
    return barBackgroundAlpha ? [barBackgroundAlpha floatValue] : 1.0;
}

/** 设置当前导航栏 TintColor(导航栏按钮等颜色)*/
- (void)h_setNavBarTintColor:(UIColor *)color {
    objc_setAssociatedObject(self, &kHQNavBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (![self pushToNextVCFinished]) {
        [self.navigationController setNeedsNavigationBarUpdateForTintColor:color];
    }
}
- (UIColor *)h_navBarTintColor {
    UIColor *tintColor = (UIColor *)objc_getAssociatedObject(self, &kHQNavBarTintColorKey);
    return (tintColor != nil) ? tintColor : [HQNavigation hq_defaultNaviBarTintColor];
}

/** 设置当前导航栏 titleColor(标题颜色)*/
- (void)h_setNavBarTitleColor:(UIColor *)color {
    objc_setAssociatedObject(self, &kHQNavBarTitleColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (![self pushToNextVCFinished]) {
        [self.navigationController setNeedsNavigationBarUpdateForTitleColor:color];
    }
}
- (UIColor *)h_navBarTitleColor {
    UIColor *titleColor = (UIColor *)objc_getAssociatedObject(self, &kHQNavBarTitleColorKey);
    return (titleColor != nil) ? titleColor : [HQNavigation hq_defaultNaviBarTitleColor];
}
/** 设置当前导航栏 shadowImage(底部分割线)是否隐藏*/
- (void)h_setNavBarShadowImageHidden:(BOOL)hidden {
    objc_setAssociatedObject(self, &kHQNavBarShadowImageHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController setNeedsNavigationBarUpdateForShadowImageHidden:hidden];
}
- (BOOL)h_navBarShadowImageHidden {
    id hidden = objc_getAssociatedObject(self, &kHQNavBarShadowImageHiddenKey);
    return hidden?[hidden boolValue]:[HQNavigation hq_defaultNaviShadowImageHidden];
}
/** 当前当前导航栏距离顶部的浮动高度*/
- (void)h_setNavBarTranslationY:(CGFloat)translationY {
    if (translationY <= 0) translationY = 0;
    if (translationY >= [self h_navgationBarHeight]) translationY = [self h_navgationBarHeight];
    objc_setAssociatedObject(self, &kHQNavBarTranslationYKey, @(translationY), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationController.navigationBar h_setTranslationY:-translationY];
    [self.navigationController.navigationBar h_setBarButtonItemsAlpha:(1.0 - (translationY / [self h_navgationBarHeight])) hasSystemBackIndicator:NO];
}
- (CGFloat)h_navBarTranslationY {
    id translationY = objc_getAssociatedObject(self, &kHQNavBarTranslationYKey);
    return translationY?[translationY floatValue]:0;
}
/** 设置当前状态栏是否隐藏,默认为NO*/
- (void)h_setStatusBarHidden:(BOOL)hidden {
    objc_setAssociatedObject(self, &kHQStatusBarHiddenKey, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsStatusBarAppearanceUpdate]; // 刷新状态栏
}
- (void)h_setIsIgnoreNavBarAnimationTransition:(BOOL)isTransition{
    objc_setAssociatedObject(self, &kHQAnimationTransitionKey, @(isTransition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)h_isIgnorenavBarAnimationTransition{
   return  [objc_getAssociatedObject(self, &kHQAnimationTransitionKey) boolValue];
}
- (BOOL)h_statusBarHidden {
    id hidden = objc_getAssociatedObject(self, &kHQStatusBarHiddenKey);
    // ** iPhoneX 下设置为不能隐藏状态栏
    if ([HQNavigation isiPhoneX]) {
        return NO;
    }
    return hidden?[hidden boolValue]:NO;
}
/** 获取当前导航栏高度*/
- (CGFloat)h_statusBarHeight {
    return CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}
- (CGFloat)h_navgationBarHeight {
    return CGRectGetHeight(self.navigationController.navigationBar.bounds);
}
/** 获取导航栏加状态栏高度*/
- (CGFloat)h_navigationBarAndStatusBarHeight {
    return CGRectGetHeight(self.navigationController.navigationBar.bounds) +
    CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}
///** 设置当前状态栏样式 白色/黑色 */
//- (void)h_setStatusBarStyle:(UIStatusBarStyle)style {
//    objc_setAssociatedObject(self, &kHQStatusBarStyleKey, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    // 调用导航栏的 preferredStatusBarStyle 方法
//    [self setNeedsStatusBarAppearanceUpdate];
//}
//- (UIStatusBarStyle)h_statusBarStyle {
//    id style = objc_getAssociatedObject(self, &kHQStatusBarStyleKey);
//    return (style != nil) ? [style integerValue] : [HQNavigation hq_defaultStatueBarStyle];
//}
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return [self h_statusBarStyle];
//}

@end
