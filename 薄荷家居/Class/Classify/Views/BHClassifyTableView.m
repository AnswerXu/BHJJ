//
//  BHClassifyTableView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHClassifyTableView.h"
#import "BHClassifyFirstTableViewCell.h"
#import "BHClassifySecondTableViewCell.h"
#import "BHClassifyItemModel.h"
#import "BHClassifyTopicModel.h"

@interface BHClassifyTableView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy) NSMutableArray<NSArray *> *itemDatas;
@property (nonatomic,copy) NSMutableArray<BHClassifyTopicModel *> *topicModels;
@end

static NSString *const classifyFirstCellIdent  = @"classifyFirstCellIdent";
static NSString *const classifySecondCellIdent = @"classifySecondCellIdent";

@implementation BHClassifyTableView

#pragma mark-  懒加载
-(NSMutableArray<NSArray *> *)itemDatas{
    if (!_itemDatas) {
        _itemDatas = [NSMutableArray array];
    }
    return _itemDatas;
}
-(NSMutableArray<BHClassifyTopicModel *> *)topicModels{
    if (!_topicModels) {
        _topicModels = [NSMutableArray array];
    }
    return _topicModels;
}

-(instancetype)init{
    if (self = [super initWithFrame:CGRectMake(0, 0, BHScreenWidth, BHScreenHeiht - 49 - 64) style:UITableViewStylePlain]) {
        [self setupClassifyTableView];
    }
    return self;
}

-(void)setupClassifyTableView{
    self.dataSource = self;
    self.delegate = self;
    self.showsVerticalScrollIndicator = NO;
    [self registerClass:[BHClassifyFirstTableViewCell class] forCellReuseIdentifier:classifyFirstCellIdent];
    [self registerClass:[BHClassifySecondTableViewCell class] forCellReuseIdentifier:classifySecondCellIdent];
    [self requestClassifyItemDatas];
    [self requestClassifyTopicDatas];
}

-(void)requestClassifyItemDatas{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    [helper Get:kAll parameter:nil success:^(id obj) {
        NSArray *channel_groups = obj[@"data"][@"channel_groups"];
        for (NSDictionary *dict in channel_groups) {
            NSMutableArray<BHClassifyItemModel *> *itemModels = [NSMutableArray array];
            for (NSDictionary *d in dict[@"channels"]) {
                BHClassifyItemModel *itemModel = [[BHClassifyItemModel alloc] initWithDictionary:d error:nil];
                [itemModels addObject:itemModel];
            }
            [self.itemDatas addObject:itemModels];
        }
    } failure:nil];
}

-(void)requestClassifyTopicDatas{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    NSDictionary *parameters = @{kLimit:@(12),kOffset:@(0)};
    [helper Get:kSpecialTopic parameter:parameters success:^(id obj) {
        NSArray *collections = obj[@"data"][@"collections"];
        for (NSDictionary *dict in collections) {
            BHClassifyTopicModel *topicModel = [[BHClassifyTopicModel alloc] initWithDictionary:dict error:nil];
            [self.topicModels addObject:topicModel];
        }
        [self reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    } failure:nil];
}

-(NSInteger)rows:(NSArray *)array{
    if(array.count == 0) return 0;
    NSInteger rows = array.count % colItemCount == 0 ? array.count / colItemCount : array.count / colItemCount + 1;
    return rows;
}

#pragma mark-  数据源代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return BHClassifyHeaderViewHeight + BHClassifyItemWidth + 10;
    }
    if (self.itemDatas.count > 0) {
        return BHClassifyHeaderViewHeight + (BHClassifyItemWidth + 20) * [self rows:self.itemDatas[indexPath.section - 1]] + BHClassifyItemSpacing + 10;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 2 ? 0.000001 : 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.000001;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        BHClassifyFirstTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:classifyFirstCellIdent];
        firstCell.textLabel.text = @"专题集合";
        firstCell.topicModels = _topicModels;
        return firstCell;
    }
    BHClassifySecondTableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:classifySecondCellIdent];
    secondCell.textLabel.text = indexPath.section == 1 ? @"地点" : @"品类";
    secondCell.itemModels = self.itemDatas[indexPath.section - 1];
    return secondCell;
}

@end
