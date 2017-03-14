//
//  BHCarefullySelectViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHCarefullySelectViewController.h"
#import "ZB_3D_CycleScrollView.h"
#import "BHAdversitementModel.h"
#import "BHHomeContentView.h"
#import "BHRaidersDetailViewController.h"
#import "BHTopicListViewController.h"

@interface BHCarefullySelectViewController ()<ZB_3D_CycleScrollViewDelegate>
@property (strong,nonatomic) ZB_3D_CycleScrollView *adView;
@property (nonatomic,copy) NSMutableArray<BHAdversitementModel *> *adverDatas;
@end

@implementation BHCarefullySelectViewController

-(ZB_3D_CycleScrollView *)adView{
    if (!_adView) {
        _adView = [[ZB_3D_CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, BHScreenWidth, BHScreenWidth * 288.0 / 720)];
        _adView.dirction = DirectionLeft;
        _adView.currentPageIndicatorTintColor = [UIColor whiteColor];
        _adView.pageIndicatorTintColor = [UIColor colorWithWhite:1.000 alpha:0.504];
        _adView.delegate = self;
        _adView.placeholderImage = [UIImage imageNamed:@"zhanwei"];
    }
    return _adView;
}
-(NSMutableArray<BHAdversitementModel *> *)adverDatas{
    if (!_adverDatas) {
        _adverDatas = [[NSMutableArray alloc] init];
    }
    return _adverDatas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.adView;
    [self requestAdvertisementDatas];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //设置手势优先级
    BHHomeContentView *contentView = (BHHomeContentView *)self.view.superview.superview.superview;
    [self.adView setLowPriorityWithGesture:contentView.panGestureRecognizer];
}

-(void)requestAdvertisementDatas{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    [helper Get:kStories parameter:nil success:^(id obj) {
        NSArray *banners = obj[@"data"][@"banners"];
        NSMutableArray *adImages = [NSMutableArray array];
        for(NSDictionary *dict in banners){
            BHAdversitementModel *model = [[BHAdversitementModel alloc] initWithDictionary:dict error:nil];
            [adImages addObject:model.image_url];
            [self.adverDatas addObject:model];
        }
        self.adView.urlImageNames = adImages;
    } failure:nil];
}

-(void)requestDatas{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    NSDictionary *paramers = @{kGender:@(1),kGeneration:@(1),kLimit:@(20),kOffset:@(self.offset)};
    [helper Get:kArticle parameter:paramers success:^(id obj) {
        if (self.isDown) {
            [self.dataSource removeAllObjects];
        }
        NSArray *items = obj[@"data"][@"items"];
        for (NSDictionary *dict in items) {
            BHHomeDataModel *model = [[BHHomeDataModel alloc] initWithDictionary:dict error:nil];
            [self.dataSource addObject:model];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } isShowSVProgressHUD:YES];}


#pragma mark-  ZB_3D_CycleScrollViewDelegate
-(void)cycleScrollView:(ZB_3D_CycleScrollView *)cycleScrollView DidSelectItem:(NSInteger)indexPathItem{
    BHTopicListViewController *topicList = [[BHTopicListViewController alloc] init];
    topicList.hidesBottomBarWhenPushed = YES;
    topicList.ID = self.adverDatas[indexPathItem].target_id;
    topicList.title = self.adverDatas[indexPathItem].target_title;
    [self.navigationController pushViewController:topicList animated:YES];
}

-(void)dealloc{
    [self.adView releaseTimer];
}

@end
