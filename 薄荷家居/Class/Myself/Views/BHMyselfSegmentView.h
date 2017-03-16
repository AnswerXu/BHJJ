//
//  BHMyselfSegmentView.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/9.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BHMyselfSegmentView;
@protocol MyselfSegmentViewDataSource <NSObject>
-(NSInteger)numberOfColumnInSegmentView:(BHMyselfSegmentView *)segmentView;
-(UIButton *)segmentView:(BHMyselfSegmentView *)segmentView ItemForColumnAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol MyselfSegmentViewDelegate <NSObject>
@optional
-(void)segmentView:(BHMyselfSegmentView *)segmentView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end


@interface BHMyselfSegmentView : UIView
@property (nonatomic,weak) id<MyselfSegmentViewDataSource> dataSource;
@property (nonatomic,weak) id<MyselfSegmentViewDelegate> delegate;
@end
