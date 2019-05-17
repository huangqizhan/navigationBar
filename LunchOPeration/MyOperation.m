//
//  MyOperation.m
//  LunchOPeration
//
//  Created by hqz on 2018/10/12.
//  Copyright © 2018年 8km. All rights reserved.
//

#import "MyOperation.h"

@interface MyOperation ()

@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;

@end

@implementation MyOperation
@synthesize executing = _executing;
@synthesize finished = _finished;
- (void)start{
    NSLog(@"thread = %@",[NSThread currentThread]);
    self.finished = NO;
    self.executing = YES;
    for (int i = 0; i < 100; i ++ ) {
        NSLog(@"i = %d name = %@",i,_title);
    }
    [self done];
}
- (void)dealloc{
    NSLog(@"dealloc");
}
- (void)done {
    self.finished = YES;
    self.executing = NO;
}
@end


@interface MyUIAlertOperation ()

@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;
@property (strong, atomic) NSThread *thread;
@property (nonatomic,strong) NSPort *port;
@end


@implementation MyUIAlertOperation

@synthesize executing = _executing;
@synthesize finished = _finished;

- (void)start{
    _thread = [NSThread currentThread];

 
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    dispatch_async(dispatch_get_main_queue()
                   , ^{
                       
                       UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
                       UIAlertAction *actoon = [UIAlertAction actionWithTitle:@"action" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                           [self done];
                       }];
                       UIViewController *baseVC = [UIApplication sharedApplication].delegate.window.rootViewController;
                       [alertvc addAction:actoon];
                       [baseVC presentViewController:alertvc animated:YES completion:nil];
                   });
    });
}
- (void)dealloc{
    NSLog(@"---dealloc");
}
- (void)done {
    self.finished = YES;
    self.executing = NO;
}
- (void)setFinished:(BOOL)finished{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}
- (void)setExecuting:(BOOL)executing{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

@end
