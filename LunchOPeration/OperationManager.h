//
//  OperationManager.h
//  LunchOPeration
//
//  Created by hqz on 2018/10/12.
//  Copyright © 2018年 8km. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyOperation.h"


@interface OperationManager : NSObject

+ (id)shareInstance;

- (void)addMyOperation:(NSOperation *)operation;
- (void)addOps:(NSArray *)ops;
@end
