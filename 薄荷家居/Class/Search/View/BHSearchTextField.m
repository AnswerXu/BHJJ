//
//  BHSearchTextField.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHSearchTextField.h"

@interface BHSearchTextField()
@property (nonatomic,strong) UIView *leftV;
@end

@implementation BHSearchTextField

-(UIView *)leftV{
    if (!_leftV) {
        UIImage *leftImage = [UIImage imageNamed:@"fangdajing"];
        _leftV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftImage.size.width + 15, leftImage.size.height)];
        
        UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, leftImage.size.width, leftImage.size.height)];
        leftView.image = leftImage;
        
        [_leftV addSubview:leftView];
    }
    return _leftV;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.leftView = self.leftV;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.placeholder = @"搜索商品、专题";
        self.background = [UIImage imageNamed:@"sousuo"];
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = BHFontColor_normal;
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
        self.tintColor = BHFontColor_selected;
    }
    return self;
}

@end
