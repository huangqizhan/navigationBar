//
//  TransitionIntrduce.h
//  NaviGationDemo
//
//  Created by hqz on 2019/3/28.
//  Copyright © 2019年 8km. All rights reserved.
//

#ifndef TransitionIntrduce_h
#define TransitionIntrduce_h


#endif /* TransitionIntrduce_h */

/*
 iOS 转场动画共3种
 
 1,NavigationController   push  pop
 
   在UINavigationControllerDelegate
 
///此方法是用来处理 push  pop 的转场动画  返回实现 UIViewControllerAnimatedTransitioning  协议的实例
 - (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
 animationControllerForOperation:(UINavigationControllerOperation)operation
 fromViewController:(UIViewController *)fromVC
 toViewController:(UIViewController *)toVC ;
 
 
 动画实现可以使用
 _transitionAnimator = [[UIViewPropertyAnimator alloc]initWithDuration:1 timingParameters:[[UISpringTimingParameters alloc]initWithDampingRatio:1 initialVelocity:CGVectorMake(1, 0)]];
 
 
///此方法是用来处理侧滑手势交互  可以继承UIPercentDrivenInteractiveTransition  也可以自己处理
 - (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
 interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController;
 
 -------------------------------------------------------
 
 2,UIViewController 模态  present  dismiss
 
  实现viewController的transitionDelegate   同上 实现响应的协议
 
 ///present 时处理
 -(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
 ///dismiss 时处理
 -(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
 
 ////在transition(模态) 过程中处理其他的动画
 -(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source;
 
 -------------------------------------------------------
 3,TabbarController  tabbar 切换
 
 实现UITabbarControllerDelegate  跟导航控制器逻辑一样
 
 */


/*
 
 ///旋转 和 设置状态栏
 
 #pragma mark ---- 屏幕旋转&状态栏样式
 /////是否自动旋转
 //- (BOOL)shouldAutorotate{
 //    return [_getTopViewcontroller(self) shouldAutorotate];
 //}
 /////旋转方向
 //- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
 //    return [_getTopViewcontroller(self) supportedInterfaceOrientations];
 //}
 /////模态状态下的跳转方向
 //- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
 //    return [_getTopViewcontroller(self) preferredInterfaceOrientationForPresentation];
 //}
 /*
 info.plist View controller-based status bar appearance 为 YES 控制器对状态栏设置的优先级高于application
 为 NO 时 以 application为准，控制器设置状态栏prefersStatusBarHidden是无效的的根本不会被调用
 */
///状态栏的样式
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return [_getTopViewcontroller(self) preferredStatusBarStyle];
//}
/////状态栏的动画类型
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
//    return [_getTopViewcontroller(self) preferredStatusBarUpdateAnimation];
//}
/////状态是否影藏
//- (BOOL)prefersStatusBarHidden{
//    return [_getTopViewcontroller(self) prefersStatusBarHidden];
//}

 
 */
