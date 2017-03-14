//
//  BHClassifyTableView.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BHClassifyItemModel;
@class BHClassifyTopicModel;
@class BHClassifyFirstCellCollectionView;
@class BHClassifySecondCellCollectionView;

@protocol ClassifyDelegate <NSObject>
-(void)firstCellCollectionView:(BHClassifyFirstCellCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath topicModel:(BHClassifyTopicModel *)model;
-(void)secondCellCollectionView:(BHClassifySecondCellCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath itemModel:(BHClassifyItemModel *)model;
-(void)firstCellLookAllWithTopicModels:(NSArray<BHClassifyTopicModel *> *)topicModels;
@end
@interface BHClassifyTableView : UITableView
@property (nonatomic,weak) id<ClassifyDelegate> classifyDelegate;
@end
