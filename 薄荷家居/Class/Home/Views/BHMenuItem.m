//
//  BHMenuItem.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHMenuItem.h"

@implementation BHMenuItem

+(instancetype)buttonWithType:(UIButtonType)buttonType{
    BHMenuItem *item = [super buttonWithType:buttonType];
    [item setTitleColor:BHFontColor_selected forState:UIControlStateSelected];
    [item setTitleColor:BHFontColor_normal forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont systemFontOfSize:14];
    return item;
}
@end
