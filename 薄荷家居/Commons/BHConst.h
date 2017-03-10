//
//  BHConst.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

//屏幕尺寸
#define BHScreenWidth  [UIScreen mainScreen].bounds.size.width
#define BHScreenHeiht  [UIScreen mainScreen].bounds.size.height


#define BHFontColor_selected  [UIColor colorWithRed:0.000 green:0.757 blue:0.682 alpha:1.000]
#define BHFontColor_normal    [UIColor colorWithWhite:0.400 alpha:1.000]
#define BHLineColor_normal    [UIColor colorWithRed:0.831 green:0.830 blue:0.842 alpha:1.000]

UIKIT_EXTERN CGFloat const BHClassifyHeaderViewHeight;
UIKIT_EXTERN CGFloat const BHClassifyItemSpacing;
UIKIT_EXTERN NSInteger const colItemCount;
#define BHClassifyItemWidth (BHScreenWidth - (colItemCount * BHClassifyItemSpacing)) / colItemCount
