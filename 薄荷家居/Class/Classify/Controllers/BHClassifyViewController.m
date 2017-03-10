//
//  BHClassifyViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHClassifyViewController.h"
#import "BHClassifyTableView.h"

@interface BHClassifyViewController ()
@property (nonatomic,strong) BHClassifyTableView *tableView;

@end

@implementation BHClassifyViewController

#pragma mark-  懒加载
-(BHClassifyTableView *)tableView{
    if (!_tableView) {
        _tableView = [[BHClassifyTableView alloc] init];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}


@end
