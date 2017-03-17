//
//  BHProductViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHProductViewController.h"
#import "BHProductCollectionView.h"
#import "BHProductModel.h"
#import "BHProductDetailViewController.h"

@interface BHProductViewController ()<UICollectionViewDelegate>
@property (nonatomic,strong) BHProductCollectionView *collectionView;
@property (nonatomic,copy) NSMutableArray<BHProductModel *> *datas;
@property (nonatomic,assign) NSInteger offset;
@property (nonatomic,assign) BOOL isDown;

@end

@implementation BHProductViewController

#pragma mark-  懒加载
-(BHProductCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[BHProductCollectionView alloc] init];
        _collectionView.delegate = self;
    }
    return _collectionView;
}
-(NSMutableArray<BHProductModel *> *)datas{
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.collectionView];
    [self requestProductDatas];
    [self refreshProductDatas];
}

-(void)refreshProductDatas{
    __weak typeof(self) weakSelf = self;
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) return;
        strongSelf.offset = 0;
        strongSelf.isDown = YES;
        [strongSelf requestProductDatas];
    }];
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) return;
        strongSelf.offset += 10;
        strongSelf.isDown = NO;
        [strongSelf requestProductDatas];
    }];
    self.collectionView.mj_header.maxY -= 10;
}

-(void)requestProductDatas{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    NSDictionary *parameters = @{kGender:@(1),kGeneration:@(1),kLimit:@(10),kOffset:@(_offset)};
    [helper Get:KProduct parameter:parameters success:^(id obj) {
        if(_isDown) [self.datas removeAllObjects];
        NSDictionary *data = obj[@"data"];
        NSArray *items = data[@"items"];
        for(NSDictionary *dict in items){
            NSDictionary *d = dict[@"data"];
            BHProductModel *model = [[BHProductModel alloc] initWithDictionary:d error:nil];
            [self.datas addObject:model];
        }
        self.collectionView.datas = self.datas;
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    } isShowSVProgressHUD:YES];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BHProductDetailViewController *commodityDetail = [[BHProductDetailViewController alloc] init];
    commodityDetail.hidesBottomBarWhenPushed = YES;
    commodityDetail.contentUrl = [NSString stringWithFormat:kOddIntroduce,_datas[indexPath.item].ID];
    NSLog(@"=====%ld=====",_datas[indexPath.item].ID);
    [self.navigationController pushViewController:commodityDetail animated:YES];
}

@end
