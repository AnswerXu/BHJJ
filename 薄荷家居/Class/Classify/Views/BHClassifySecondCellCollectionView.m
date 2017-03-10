//
//  BHClassifySecondCellCollectionView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHClassifySecondCellCollectionView.h"
#import "BHClassifyItemModel.h"

@interface BHClassifySecondCellCollectionView()<UICollectionViewDataSource>
@end

@interface BHClassifyCollectionViewFlowLayout : UICollectionViewFlowLayout
@end
@implementation BHClassifyCollectionViewFlowLayout
-(void)prepareLayout{
    self.itemSize = CGSizeMake(BHClassifyItemWidth, BHClassifyItemWidth + 20);
    self.minimumLineSpacing = BHClassifyItemSpacing;
    self.minimumInteritemSpacing = BHClassifyItemSpacing;
}
@end

@interface BHClassifyCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@end
@implementation BHClassifyCollectionViewCell
#pragma mark-  懒加载
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = BHFontColor_normal;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.width, self.width);
    self.titleLabel.frame = CGRectMake(0, self.imageView.maxY + 5, self.width, 15);
}
@end

static NSString *const classifyCollectionViewCellIdent = @"classifyCollectionViewCellIdent";
@implementation BHClassifySecondCellCollectionView
-(instancetype)init{
    if (self = [super initWithFrame:CGRectZero collectionViewLayout:[[BHClassifyCollectionViewFlowLayout alloc] init]]) {
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[BHClassifyCollectionViewCell class] forCellWithReuseIdentifier:classifyCollectionViewCellIdent];
        self.contentInset = UIEdgeInsetsMake(0, BHClassifyItemSpacing * 0.5, 0, BHClassifyItemSpacing * 0.5);
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _itemModels.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BHClassifyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:classifyCollectionViewCellIdent forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_itemModels[indexPath.item].icon_url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    cell.titleLabel.text = _itemModels[indexPath.item].name;
    return cell;
}

@end
