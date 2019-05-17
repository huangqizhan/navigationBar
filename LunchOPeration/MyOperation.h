//
//  MyOperation.h
//  LunchOPeration
//
//  Created by hqz on 2018/10/12.
//  Copyright © 2018年 8km. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MyOperation : NSOperation

@property (nonatomic,copy) NSString *title;

- (void)done ;

@end



@interface MyUIAlertOperation : NSOperation
@property (nonatomic,copy) NSString *title;

- (void)done ;

@end
