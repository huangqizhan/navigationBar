//
//  OperationManager.m
//  LunchOPeration
//
//  Created by hqz on 2018/10/12.
//  Copyright © 2018年 8km. All rights reserved.
//

#import "OperationManager.h"

@interface OperationManager ()
@property (nonatomic,strong) NSOperationQueue *queue;
@property (nonatomic,strong) MyOperation *lastOperation;
@end

@implementation OperationManager

+ (id)shareInstance{
    static OperationManager * man = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        man = [OperationManager new];
    });
    return man;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        _queue = [[NSOperationQueue alloc] init];
    _queue.maxConcurrentOperationCount = 1;
    }
    return self;
}
- (void)addMyOperation:(NSOperation *)operation{
    if (!operation) return;
//    [_queue addOperation:operation];
    [operation start];
    NSLog(@"num = %ld",_queue.operationCount);
}
- (void)addOps:(NSArray *)ops{
    [_queue addOperations:ops waitUntilFinished:YES];
}

@end
