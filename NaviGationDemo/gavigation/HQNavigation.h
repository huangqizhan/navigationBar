//
//  HQNavigation.h
//  NaviGationDemo
//
//  Created by hqz on 2019/3/7.
//  Copyright © 2019年 8km. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UINavigationBar (HQNavigation)
///设置导航栏背景视图
- (void)h_setBackGroundView:(UIView *)view;

///设施导航栏背景imageView
- (void)h_setBackgroundImage:(UIImage *)image;

/// 设置导航栏背景颜色
- (void)h_setBackgroundColor:(UIColor *)color;

///设置导航栏透明度
- (void)h_setBackgroundAlpha:(CGFloat)alpha;

///设置当前 NavigationBar 底部分割线是否隐藏
- (void)h_setShadowImageHidden:(BOOL)hidden;

///设置当前 NavigationBar _UINavigationBarBackIndicatorView (默认的返回箭头)是否隐藏
- (void)h_setBarBackIndicatorViewHidden:(BOOL)hidden;

///设置导航栏所有 barButtonItem 的透明度
- (void)h_setBarButtonItemsAlpha:(CGFloat)alpha hasSystemBackIndicator:(BOOL)hasSystemBackIndicator;

///设置当前 NavigationBar 垂直方向上的平移距离
- (void)h_setTranslationY:(CGFloat)translationY;

///获取当前导航栏垂直方向上偏移了多少
- (CGFloat)h_getTranslationY;



@end


typedef NS_ENUM(NSInteger, HQNavigationSwitchStyle) {
    // 颜色过渡的方式，支付宝个人中心到余额宝切换效果
    HQNavigationSwitchStyleTransition = 0,
    // 两种不同颜色导航栏，类似微信红包
    HQNavigationSwitchStyleFakeNavBar = 1,
};

@interface UIViewController (HQNavigation)

/* 设置导航栏改变的样式 */
- (void)h_setNavigationSwitchStyle:(HQNavigationSwitchStyle)style;
- (HQNavigationSwitchStyle )h_navigationSwitchStyle;


/** 设置隐藏当前导航栏*/
- (void)h_setNavBarHidden:(BOOL)hidden;
- (BOOL)h_navBarHidden;


/** 1.设置当前导航栏的背景View*/
- (void)h_setNavBarBackgroundView:(UIView *)view;
- (UIView *)h_navBarBackgroundView;


/** 2.设置当前导航栏的背景图片*/
- (void)h_setNavBarBackgroundImage:(UIImage *)image;
- (UIImage *)h_navBarBackgroundImage;


/** 3.设置当前导航栏 barTintColor(导航栏背景颜色)*/
- (void)h_setNavBarBackgroundColor:(UIColor *)color ;
- (UIColor *)h_navBarBackgroundColor ;


/** 当前导航栏的透明度*/
- (void)h_setNavBarBackgroundAlpha:(CGFloat)alpha;
- (CGFloat)h_navBarBackgroundAlpha;

/** 设置当前导航栏 TintColor(导航栏按钮等颜色)*/
- (void)h_setNavBarTintColor:(UIColor *)color ;
- (UIColor *)h_navBarTintColor ;


/** 设置当前导航栏 titleColor(标题颜色)*/
- (void)h_setNavBarTitleColor:(UIColor *)color ;
- (UIColor *)h_navBarTitleColor ;


/** 设置当前导航栏 shadowImage(底部分割线)是否隐藏*/
- (void)h_setNavBarShadowImageHidden:(BOOL)hidden ;
- (BOOL)h_navBarShadowImageHidden ;

/** 当前当前导航栏距离顶部的浮动高度*/
- (void)h_setNavBarTranslationY:(CGFloat)translationY ;
- (CGFloat)h_navBarTranslationY;

/** 设置当前状态栏是否隐藏,默认为NO*/
- (void)h_setStatusBarHidden:(BOOL)hidden;
- (BOOL)h_statusBarHidden;

/** 设置是否添加导航栏的过度效果 */
- (void)h_setIsIgnoreNavBarAnimationTransition:(BOOL)isTransition;

///** 设置当前状态栏样式 白色/黑色 */
//- (UIStatusBarStyle)h_statusBarStyle;
//- (void)h_setStatusBarStyle:(UIStatusBarStyle)style;

@end

