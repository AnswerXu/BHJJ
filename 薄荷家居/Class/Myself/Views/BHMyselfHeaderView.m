//
//  BHMyselfHeaderView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/9.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHMyselfHeaderView.h"
#import "BHMyselfSegmentView.h"

@interface BHMyselfHeaderView()<MyselfSegmentViewDataSource>
@property (nonatomic,strong) UIImageView *backgroundView;

@end

CGFloat const headerViewHeight = 250;
static CGFloat const segmentViewHeight = 40;
@implementation BHMyselfHeaderView

-(UIImageView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] init];
        _backgroundView.image = [UIImage imageNamed:@"Me_ProfileBackground"];
        _backgroundView.contentMode = UIViewContentModeScaleToFill;
        _backgroundView.userInteractionEnabled = YES;
        _backgroundView.clipsToBounds = YES;
    }
    return _backgroundView;
}
-(BHMyselfSegmentView *)segmentView{
    if (!_segmentView) {
        _segmentView = [[BHMyselfSegmentView alloc] init];
        _segmentView.dataSource = self;
    }
    return _segmentView;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:CGRectMake(0, -headerViewHeight, BHScreenWidth, headerViewHeight)]) {
        [self addSubview:self.backgroundView];
        [self addSubview:self.segmentView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundView.frame = self.bounds;
    self.segmentView.frame = CGRectMake((self.width - BHScreenWidth)/2, self.backgroundView.maxY - segmentViewHeight, BHScreenWidth, segmentViewHeight);
}

#pragma mark-  BHMyselfSegmentDataSource
-(NSInteger)numberOfColumnInSegmentView:(BHMyselfSegmentView *)segmentView{
    return 2;
}
-(UIButton *)segmentView:(BHMyselfSegmentView *)segmentView ItemForColumnAtIndexPath:(NSIndexPath *)indexPath{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    [item setTitle:indexPath.item == 0 ? @"喜欢的商品" : @"喜欢的专题" forState:UIControlStateNormal];
    [item setTitleColor:BHFontColor_normal forState:UIControlStateNormal];
    item.titleLabel.font = [UIFont systemFontOfSize:16];
    return item;
}

@end
