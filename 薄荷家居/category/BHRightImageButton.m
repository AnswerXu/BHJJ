//
//  BHRightImageButton.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHRightImageButton.h"

@implementation BHRightImageButton

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect titleLabelTemp = self.titleLabel.frame;
    titleLabelTemp.origin.x = 0;
    self.titleLabel.frame = titleLabelTemp;
    
    CGRect imageViewTemp = self.imageView.frame;
    imageViewTemp.origin.x = self.titleLabel.maxX + 5;
    self.imageView.frame = imageViewTemp;
}

@end
