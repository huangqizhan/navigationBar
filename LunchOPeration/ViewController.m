//
//  ViewController.m
//  LunchOPeration
//
//  Created by hqz on 2018/10/12.
//  Copyright © 2018年 8km. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "Model+Add.h"


@interface ViewController (){
    UILabel *_label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    NSString *content = @"就是想让多余的内容显示成省略号，内容是足够多的，直接就切掉了多余的内容根本没有省略号，哪里出问题了 直接就切掉了多余的内容根本没有省略号，哪里出问题了直接就切掉了多余的内容根本没有省略号，哪里出问题了";
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:content attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]}];
    _label.numberOfLines = 2;
    _label.attributedText = att;
    _label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_label];
    
}
- (void)testAction{
    NSLog(@"testAction");
}

@end


