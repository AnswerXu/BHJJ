//
//  BHMyselfSettingViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/9.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHMyselfSettingViewController.h"
#import "BHSettingTableView.h"

@interface BHMyselfSettingViewController ()
@property (nonatomic,strong) BHSettingTableView *tableView;
@end

@implementation BHMyselfSettingViewController

-(BHSettingTableView *)tableView{
    if (!_tableView) {
        _tableView = [[BHSettingTableView alloc] initWithFrame:CGRectMake(0, 0, BHScreenWidth, BHScreenHeiht - 49 - 64)];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



@end
