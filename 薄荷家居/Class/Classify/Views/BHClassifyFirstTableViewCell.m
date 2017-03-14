//
//  BHClassifyFirstTableViewCell.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHClassifyFirstTableViewCell.h"
#import "BHRightImageButton.h"
#import "BHClassifyFirstCellCollectionView.h"

@interface BHClassifyFirstTableViewCell()

@end

@implementation BHClassifyFirstTableViewCell

#pragma mark-  懒加载
-(BHClassifyFirstCellCollectionView *)scrollView{
    if (!_collectionView) {
        _collectionView = [[BHClassifyFirstCellCollectionView alloc] init];
    }
    return _collectionView;
}
-(BHRightImageButton *)lookAllButton{
    if (!_lookAllButton) {
        _lookAllButton = [BHRightImageButton buttonWithType:UIButtonTypeCustom];
        [_lookAllButton setTitle:@"查看全部" forState:UIControlStateNormal];
        [_lookAllButton setImage:[UIImage imageNamed:@"icon_search_rightArrow"] forState:UIControlStateNormal];
        _lookAllButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_lookAllButton setTitleColor:BHFontColor_normal forState:UIControlStateNormal];
    }
    return _lookAllButton;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.textLabel.font = [UIFont systemFontOfSize:15];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.scrollView];
    [self.contentView addSubview:self.lookAllButton];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(10, 0, 150, BHClassifyHeaderViewHeight);
    
    CGSize lookAllButtonSize = [self.lookAllButton sizeThatFits:CGSizeMake(self.width, MAXFLOAT)];
    self.lookAllButton.frame = CGRectMake(self.width - lookAllButtonSize.width - 10, self.textLabel.y, lookAllButtonSize.width, self.textLabel.height);
    
    self.collectionView.frame = CGRectMake(0, self.textLabel.maxY, self.width, BHClassifyItemWidth);
}

-(void)setTopicModels:(NSArray<BHClassifyTopicModel *> *)topicModels{
    _topicModels = topicModels;
    self.collectionView.topicModels = topicModels;
}


@end
