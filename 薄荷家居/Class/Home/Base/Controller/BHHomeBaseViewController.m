//
//  BHHomeBaseViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHHomeBaseViewController.h"


@interface BHHomeBaseViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation BHHomeBaseViewController

#pragma mark-  懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

-(void)requestDatas{
    
    
}

#pragma mark-  数据源代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}



@end
