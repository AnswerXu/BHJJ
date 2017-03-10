//
//  BHHomeBaseViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHHomeBaseViewController.h"
#import "BHBaseTableViewCell.h"

@interface BHHomeBaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

static NSString *const baseTableViewCellIdent = @"baseTableViewCellIdent";
@implementation BHHomeBaseViewController

#pragma mark-  懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        [_tableView registerClass:[BHBaseTableViewCell class] forCellReuseIdentifier:baseTableViewCellIdent];
    }
    return _tableView;
}
-(NSMutableArray<BHHomeDataModel *> *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self requestDatas];
    [self refresh];
}

-(void)requestDatas{
}
-(void)refresh{
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) return;
        self.isDown = YES;
        self.offset = 0;
        [strongSelf requestDatas];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) return;
        self.isDown = NO;
        self.offset += 10;
        [strongSelf requestDatas];
    }];
}

#pragma mark-  数据源代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.000001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 329 / 720.f * (BHScreenWidth - 20) + 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BHBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:baseTableViewCellIdent];
    cell.dataModel = _dataSource[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"---%ld===%@",indexPath.row,self.dataSource[indexPath.row].title);
}

@end
