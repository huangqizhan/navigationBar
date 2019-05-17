//
//  Model.m
//  LunchOPeration
//
//  Created by hqz on 2018/10/15.
//  Copyright © 2018年 8km. All rights reserved.
//

#import "Model.h"

@implementation Model


- (void)modelAction{
    NSString *name = [self name];
    NSLog(@"name = %@",name);
}

- (NSString *)name{
    return @"model";
}
@end
