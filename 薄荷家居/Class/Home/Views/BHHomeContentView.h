//
//  BHHomeContentView.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BHHomeContentView;
@protocol HomeContentViewDelegate <NSObject>
-(void)homeContentViewWillBeginDragging:(BHHomeContentView *)scrollView;
@end
@interface BHHomeContentView : UICollectionView
@property (nonatomic,weak) id<HomeContentViewDelegate> scrollDelegate;
@property (nonatomic,copy) NSArray<UIViewController *> *childs;
-(void)scrollWithIndexPath:(NSIndexPath *)indexPath;
@end
