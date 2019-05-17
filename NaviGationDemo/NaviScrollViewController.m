//
//  NaviScrollViewController.m
//  NaviGationDemo
//
//  Created by hqz on 2019/3/27.
//  Copyright © 2019年 8km. All rights reserved.
//

#import "NaviAlphaViewController.h"
#import "HideViewController.h"
#import "NaviBackImageViewController.h"
#import "NaviScrollViewController.h"
#import "TabVcViewController.h"
#import "MotalViewController.h"
#import "WeChatStyleViewController.h"
#import "ColorGradientViewController.h"
#import "HQNavigation.h"

@interface NaviScrollViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NaviScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航栏滚动";
    [self h_setNavBarBackgroundColor:[UIColor colorWithRed:(rand() % 100 * 0.01) green:(rand() % 100 * 0.01) blue:0.86 alpha:1.00]];
    [self h_setNavBarShadowImageHidden:YES];
    self.navBackButtonColor = [UIColor blackColor];
    // 设置一个自定义导航栏View
//    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//    toolBar.translucent = YES;
    //[self vhl_setNavBarBackgroundView:toolBar];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}
#pragma mark - UIScrollview Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    /** 1. VC 中设置*/
    if (offsetY > 0) {
        [self h_setNavBarTranslationY:offsetY];
    } else {
        [self h_setNavBarTranslationY:0.0];
    }
    
    /** 2. 自己管理 NavigationBar方式设置导航栏浮动*/
    //    CGFloat navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.bounds);
    //    CGFloat progress = offsetY / navBarHeight;
    //    if (offsetY > 0) {
    //        if (offsetY >= navBarHeight) {
    //            [self setNavigationBarTransformProgress:1];
    //        } else {
    //            [self setNavigationBarTransformProgress:progress];
    //        }
    //    } else {
    //        [self setNavigationBarTransformProgress:0.0f];
    //    }
}
- (void)setNavigationBarTransformProgress:(CGFloat)progress {
    CGFloat navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.bounds);
    NSLog(@"%f",(-navBarHeight * progress));
    [self.navigationController.navigationBar h_setTranslationY:(-navBarHeight * progress)];
    [self.navigationController.navigationBar h_setBarButtonItemsAlpha:(1 - progress) hasSystemBackIndicator:YES];
}
#pragma mark -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell - %d", (int)indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithRed:(rand() % 100 * 0.01) green:(rand() % 100 * 0.01) blue:0.86 alpha:1.00];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WeChatStyleViewController *fakeVC = [[WeChatStyleViewController alloc] init];
    [self.navigationController pushViewController:fakeVC animated:YES];
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
