//
//  BHCycleScrollView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/17.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHCycleScrollView.h"

@interface BHCycleScrollView()<UICollectionViewDataSource>
@end

@interface BHCycleScrollViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *imageView;
@end
@implementation BHCycleScrollViewCell
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _imageView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}
@end

@interface BHCycleScrollViewFlowLayout : UICollectionViewFlowLayout
@end
@implementation BHCycleScrollViewFlowLayout
-(void)prepareLayout{
    self.itemSize = CGSizeMake(BHScreenWidth, BHScreenWidth);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 0;
}
@end

static NSString * const cycleCellIdent = @"cycleCellIdent";
@implementation BHCycleScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame collectionViewLayout:[[BHCycleScrollViewFlowLayout alloc] init]]) {
        self.dataSource = self;
        [self registerClass:[BHCycleScrollViewCell class] forCellWithReuseIdentifier:cycleCellIdent];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageUrls.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BHCycleScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cycleCellIdent forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrls[indexPath.item]] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    return cell;
}
@end
