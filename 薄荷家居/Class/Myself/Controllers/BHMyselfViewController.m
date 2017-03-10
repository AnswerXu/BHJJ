//
//  BHMyselfViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHMyselfViewController.h"
#import "BHMyselfCollectTableView.h"
#import "BHMyselfHeaderView.h"
#import "BHMyselfSettingViewController.h"

@interface BHMyselfViewController ()<MyselfCollectTableViewDelegate>
@property (nonatomic,strong) BHMyselfCollectTableView *tableView;
@property (nonatomic,strong) BHMyselfHeaderView *headerView;
@end

@implementation BHMyselfViewController

#pragma mark-  懒加载
-(BHMyselfCollectTableView *)tableView{
    if (!_tableView) {
        _tableView = [[BHMyselfCollectTableView alloc] initWithFrame:CGRectMake(0, -20, BHScreenWidth, BHScreenHeiht - 49)];
        _tableView.goodsDatas = @[@1,@2,@3];
        _tableView.collectdelegate = self;
        [_tableView addSubview:self.headerView];
        _tableView.headerView = self.headerView;
        _tableView.contentInset = UIEdgeInsetsMake(self.headerView.height, 0, 0, 0);
    }
    return _tableView;
}

-(BHMyselfHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[BHMyselfHeaderView alloc] init];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.tableView];
    [self setupNavigationItems];
}

-(void)setupNavigationItems{
    [self.view addSubview:({
        UIButton *notic = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"icon_navigationItem_message_white"];
        [notic setImage:image forState:UIControlStateNormal];
        notic.frame = CGRectMake(15, 20 + (44 - image.size.height)/2, image.size.width, image.size.height);
        [notic addTarget:self action:@selector(noticItemAction) forControlEvents:UIControlEventTouchUpInside];
        notic;
    })];
    [self.view addSubview:({
        UIButton *setting = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"icon_navigationItem_set_white"];
        [setting setImage:image forState:UIControlStateNormal];
        setting.frame = CGRectMake(self.view.width - image.size.width - 15, 20 + (44 - image.size.height)/2, image.size.width, image.size.height);
        [setting addTarget:self action:@selector(setItemAction) forControlEvents:UIControlEventTouchUpInside];
        setting;
    })];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark-  MyselfCollectTableViewDelegate
-(void)collectTableView:(BHMyselfCollectTableView *)collectTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self setItemAction];
}

#pragma mark-  事件监听
-(void)setItemAction{
    [self.navigationController pushViewController:[BHMyselfSettingViewController new] animated:YES];
}
-(void)noticItemAction{
    
}

@end
