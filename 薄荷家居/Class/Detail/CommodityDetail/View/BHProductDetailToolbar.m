//
//  BHProductDetailToolbar.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/17.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHProductDetailToolbar.h"

@interface BHProductDetailToolbar()

@end

@implementation BHProductDetailToolbar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIBarButtonItem *collectItem = [[UIBarButtonItem alloc] initWithCustomView:({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 100, 30);
            [button setTitle:@"喜欢" forState:UIControlStateNormal];
            button;
        })];
        UIBarButtonItem *linkItem = [[UIBarButtonItem alloc] initWithCustomView:({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 100, 30);
            [button setTitle:@"去天猫链接" forState:UIControlStateNormal];
            button;
        })];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        self.items = @[collectItem,space,linkItem];
    }
    return self;
}

@end
