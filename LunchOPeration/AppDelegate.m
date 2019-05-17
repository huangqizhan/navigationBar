//
//  AppDelegate.m
//  LunchOPeration
//
//  Created by hqz on 2018/10/12.
//  Copyright © 2018年 8km. All rights reserved.
//

#import "AppDelegate.h"
#import "OperationManager.h"
#import "ViewController.h"
#import "MyOperation.h"
#import "OperatopnTask/TestOperation.h"
#import "OperatopnTask/HQBaseOperation.h"
#import "OperatopnTask/NSOperation+Operation.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController *vc = [[ViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = vc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    TestOperation *p1 = [TestOperation new];
    p1.title = @"p1";
    TestOperationA *p2 = [TestOperationA new];
    p2.title = @"p2";
    TestOperationB *p3 = [TestOperationB new];
    p3.title = @"p3";
    TestOperationC *p4 = [TestOperationC new];
    p4.title = @"p4";
    [p1 startAfterOperations:p2,nil];
    [p2 startAfterOperations:p3,nil];
    [p3 startAfterOperations:p4,nil];
    
    [NSOperationQueue asyncConCurrentStartOperations:p1,p2,p3,p4];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
