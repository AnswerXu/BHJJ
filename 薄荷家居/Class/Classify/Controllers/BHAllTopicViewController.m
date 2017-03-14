//
//  BHAllTopicViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/13.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHAllTopicViewController.h"
#import "BHAllTopicTableViewCell.h"
#import "BHTopicListViewController.h"
#import "BHClassifyTopicModel.h"

@interface BHAllTopicViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

static NSString *const allTopicTableViewCellIdent = @"allTopicTableViewCellIdent";
@implementation BHAllTopicViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, BHScreenWidth, BHScreenHeiht - 64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部专题";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BHAllTopicTableViewCell class]) bundle:nil] forCellReuseIdentifier:allTopicTableViewCellIdent];
}

#pragma mark-  数据源代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 280 / 612.f * (BHScreenWidth - 30);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _topicModels.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BHAllTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:allTopicTableViewCellIdent];
    cell.topicModel = _topicModels[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BHTopicListViewController *topicList = [[BHTopicListViewController alloc] init];
    topicList.hidesBottomBarWhenPushed = YES;
    topicList.ID = _topicModels[indexPath.row].ID;
    topicList.title = _topicModels[indexPath.row].title;
    [self.navigationController pushViewController:topicList animated:YES];
}


@end
