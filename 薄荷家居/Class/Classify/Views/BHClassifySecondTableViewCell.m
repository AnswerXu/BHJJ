//
//  BHClassifySecondTableViewCell.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHClassifySecondTableViewCell.h"
#import "BHClassifySecondCellCollectionView.h"

@interface BHClassifySecondTableViewCell()
@property (nonatomic,strong) BHClassifySecondCellCollectionView *collectionView;
@end

@implementation BHClassifySecondTableViewCell

#pragma mark-  懒加载
-(BHClassifySecondCellCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[BHClassifySecondCellCollectionView alloc] init];
    }
    return _collectionView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.collectionView];
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(10, 0, self.width, BHClassifyHeaderViewHeight);
    self.collectionView.frame = CGRectMake(0, self.textLabel.maxY, self.width, self.height - 10 - BHClassifyHeaderViewHeight);
}

-(void)setItemModels:(NSArray<BHClassifyItemModel *> *)itemModels{
    _itemModels = itemModels;
    self.collectionView.itemModels = itemModels;
    [self.collectionView reloadData];
}
@end
