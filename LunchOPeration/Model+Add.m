//
//  Model+Add.m
//  LunchOPeration
//
//  Created by hqz on 2018/10/15.
//  Copyright © 2018年 8km. All rights reserved.
//

#import "Model+Add.h"

@implementation NSObject (Add)
- (NSString *)name{
    return @"cate";
}

- (void)cateAction{
    NSString *name = [self name];
    NSLog(@"ca name = %@",name);
}
@end
