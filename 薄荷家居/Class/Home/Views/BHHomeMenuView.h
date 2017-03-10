//
//  BHHomeMenuView.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BHMenuItem;
@class BHHomeMenuView;
@protocol MenuViewDelegate <NSObject>
-(NSInteger)numberOfColumnsInMenuView:(BHHomeMenuView *)menuView;
-(BHMenuItem *)menuView:(BHHomeMenuView *)menuView itemForColumnAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface BHHomeMenuView : UIImageView
@property (nonatomic,copy) NSMutableArray<BHMenuItem *> *items;
@property (nonatomic,weak) id<MenuViewDelegate> delegate;
-(void)scrollLineAnimationWithIndex:(NSInteger)index;
@end
