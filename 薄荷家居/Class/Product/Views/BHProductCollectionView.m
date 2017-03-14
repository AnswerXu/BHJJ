//
//  BHProductCollectionView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHProductCollectionView.h"
#import "BHProductCollectionViewCell.h"
#import "BHProductModel.h"

@interface BHProductCollectionView()<UICollectionViewDataSource>

@end

@interface BHProductCollectionViewFlowLayout : UICollectionViewFlowLayout
@end
static const CGFloat edgeSpacing  = 10;
static const CGFloat lineSpacing  = 10;
static const CGFloat interSpacing = 10;
static const NSInteger itemColCount   = 2;
@implementation BHProductCollectionViewFlowLayout
-(void)prepareLayout{
    CGFloat itemWidth = (BHScreenWidth - edgeSpacing * 2 - (itemColCount - 1) * interSpacing) / itemColCount;
    CGFloat itemHeight = itemWidth / 2.f * 3;
    self.itemSize = CGSizeMake(itemWidth, itemHeight);
    self.minimumLineSpacing = lineSpacing;
    self.minimumInteritemSpacing = interSpacing;
}
@end

static NSString * const productCellIdent = @"productCellIdent";
@implementation BHProductCollectionView

#pragma mark-  初始化方法
-(instancetype)init{
    if (self = [super initWithFrame:CGRectMake(0, 0, BHScreenWidth, BHScreenHeiht - 49 - 64) collectionViewLayout:[[BHProductCollectionViewFlowLayout alloc] init]]) {
        [self setupCollectionView];
    }
    return self;
}

-(void)setupCollectionView{
    self.dataSource = self;
    self.contentInset = UIEdgeInsetsMake(edgeSpacing/2, edgeSpacing, edgeSpacing/2, edgeSpacing);
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self registerNib:[UINib nibWithNibName:NSStringFromClass([BHProductCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:productCellIdent];
}

-(void)setDatas:(NSArray<BHProductModel *> *)datas{
    _datas = datas;
    [self reloadData];
}

#pragma mark-  数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _datas.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BHProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:productCellIdent forIndexPath:indexPath];
    cell.productModel = _datas[indexPath.item];
    return cell;
}

@end
