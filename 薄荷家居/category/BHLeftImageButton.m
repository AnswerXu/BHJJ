//
//  BHDisplayButton.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHDisplayButton.h"

@implementation BHDisplayButton

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect imageViewTemp = self.imageView.frame;
    imageViewTemp.origin.x = 0;
    self.imageView.frame = imageViewTemp;
    
    CGRect titleLabelTemp = self.titleLabel.frame;
    titleLabelTemp.origin.x = self.imageView.maxX + 5;
    self.titleLabel.frame = titleLabelTemp;
}

@end
