//
//  BHKeywordCollectionView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHKeywordCollectionView.h"

@interface BHKeywordCollectionView()<UICollectionViewDataSource>
@end

@interface BHKeywordFlowLayout : UICollectionViewFlowLayout
@end
NSInteger const itemColumn = 5;
CGFloat const minimumLineSpacing = 10;
CGFloat const minimumInteritemSpacing = 10;
CGFloat const itemHeight = 30;
CGFloat const edgeSpacing = 15;
@implementation BHKeywordFlowLayout
-(void)prepareLayout{
    CGFloat itemWidth = (BHScreenWidth - (itemColumn - 1) * minimumInteritemSpacing - 2 * edgeSpacing) / itemColumn;
    self.itemSize = CGSizeMake(itemWidth, itemHeight);
    self.minimumLineSpacing = minimumLineSpacing;
    self.minimumInteritemSpacing = minimumInteritemSpacing;
}
@end

@interface BHKeywordCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *textLabel;
@end
@implementation BHKeywordCollectionViewCell
-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.layer.borderColor = BHFontColor_light.CGColor;
        _textLabel.layer.borderWidth = 0.5;
        _textLabel.layer.cornerRadius = 3;
        _textLabel.textColor = BHFontColor_light;
        _textLabel.font = [UIFont systemFontOfSize:13];
    }
    return _textLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}
@end

static NSString *const keywordCollectionViewCellIdent = @"keywordCollectionViewCellIdent";
@implementation BHKeywordCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame collectionViewLayout:[[BHKeywordFlowLayout alloc] init]]) {
        self.dataSource = self;
        [self registerClass:[BHKeywordCollectionViewCell class] forCellWithReuseIdentifier:keywordCollectionViewCellIdent];
        self.contentInset = UIEdgeInsetsMake(0, edgeSpacing, 0, edgeSpacing);
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark-  数据源代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _sectionDatas.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BHKeywordCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:keywordCollectionViewCellIdent forIndexPath:indexPath];
    cell.textLabel.text = _sectionDatas[indexPath.item];
    return cell;
}

@end
