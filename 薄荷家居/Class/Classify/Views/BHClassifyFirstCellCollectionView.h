//
//  BHClassifyFirstCellCollectionView.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BHClassifyTopicModel;
@interface BHClassifyFirstCellCollectionView : UICollectionView
@property (nonatomic,copy) NSArray<BHClassifyTopicModel *> *topicModels;
@end
