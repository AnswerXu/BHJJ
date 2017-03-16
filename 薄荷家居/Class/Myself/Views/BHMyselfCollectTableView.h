//
//  BHMyCollectTableView.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/9.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MyselfCollectGoods = 0,
    MyselfCollectTopic,
} MyselfCollectStyle;

@class BHMyselfCollectTableView;
@class BHMyselfHeaderView;
@class BHTopicBaseModel;
@protocol MyselfCollectTableViewDelegate <NSObject>
-(void)collectTableView:(BHMyselfCollectTableView *)collectTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface BHMyselfCollectTableView : UITableView
@property (nonatomic,assign) MyselfCollectStyle selectedStyle;
@property (nonatomic,copy) NSArray *goodsDatas;
@property (nonatomic,copy) NSArray<BHTopicBaseModel *> *topicDatas;
@property (nonatomic,weak) id<MyselfCollectTableViewDelegate> collectdelegate;
@property (nonatomic,strong) BHMyselfHeaderView *headerView;
@end
