//
//  BHClassifyViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHClassifyViewController.h"
#import "BHClassifyTableView.h"
#import "BHTopicListViewController.h"
#import "BHClassifyTopicModel.h"
#import "BHClassifyItemModel.h"
#import "BHAllTopicViewController.h"

@interface BHClassifyViewController ()<ClassifyDelegate>
@property (nonatomic,strong) BHClassifyTableView *tableView;

@end

@implementation BHClassifyViewController

#pragma mark-  懒加载
-(BHClassifyTableView *)tableView{
    if (!_tableView) {
        _tableView = [[BHClassifyTableView alloc] init];
        _tableView.classifyDelegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark-  ClassifyDelegate
-(void)firstCellCollectionView:(BHClassifyFirstCellCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath topicModel:(BHClassifyTopicModel *)model{
    BHTopicListViewController *topicList = [[BHTopicListViewController alloc] init];
    topicList.hidesBottomBarWhenPushed = YES;
    topicList.ID = model.ID;
    topicList.title = model.title;
    [self.navigationController pushViewController:topicList animated:YES];
}

-(void)secondCellCollectionView:(BHClassifySecondCellCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath itemModel:(BHClassifyItemModel *)model{
    BHTopicListViewController *topicList = [[BHTopicListViewController alloc] init];
    topicList.hidesBottomBarWhenPushed = YES;
    topicList.ID = model.ID;
    topicList.title = model.name;
    [self.navigationController pushViewController:topicList animated:YES];
}

-(void)firstCellLookAllWithTopicModels:(NSArray<BHClassifyTopicModel *> *)topicModels{
    BHAllTopicViewController *allTopic = [[BHAllTopicViewController alloc] init];
    allTopic.hidesBottomBarWhenPushed = YES;
    allTopic.topicModels = topicModels;
    [self.navigationController pushViewController:allTopic animated:YES];
}


@end
