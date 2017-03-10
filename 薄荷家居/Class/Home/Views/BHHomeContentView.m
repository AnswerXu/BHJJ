//
//  BHHomeContentView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHHomeContentView.h"

@interface BHHomeContentView()<UICollectionViewDataSource,UICollectionViewDelegate>
@end

@interface BHHomeContentViewFlowLayout : UICollectionViewFlowLayout
@end
@implementation BHHomeContentViewFlowLayout
-(void)prepareLayout{
    self.itemSize = CGSizeMake(BHScreenWidth, BHScreenHeiht - 64 - 49 - 36);
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}
@end

static NSString *const contentViewCellIdent = @"contentViewCell";
@implementation BHHomeContentView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame collectionViewLayout:[[BHHomeContentViewFlowLayout alloc] init]]) {
        self.dataSource = self;
        self.delegate = self;
        self.bounces = YES;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:contentViewCellIdent];
    }
    return self;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _childs.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:contentViewCellIdent forIndexPath:indexPath];
    UIView *view = _childs[indexPath.item].view;
    view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:view];
    return cell;
}

-(void)scrollWithIndexPath:(NSIndexPath *)indexPath{
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if ([_scrollDelegate respondsToSelector:@selector(homeContentViewWillBeginDragging:)]) {
        [_scrollDelegate homeContentViewWillBeginDragging:(BHHomeContentView *)scrollView];
    }
}
@end
