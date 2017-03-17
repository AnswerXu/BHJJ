//
//  BHProductDetailHeaderView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/17.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHProductDetailHeaderView.h"
#import "BHCycleScrollView.h"
#import "BHDescriptionView.h"

@interface BHProductDetailHeaderView()<UICollectionViewDelegate>
@property (nonatomic,strong) BHCycleScrollView *cycleView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) BHDescriptionView *descriptionView;
@end

@implementation BHProductDetailHeaderView

-(BHCycleScrollView *)cycleView{
    if (!_cycleView) {
        _cycleView = [[BHCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.width)];
        _cycleView.delegate = self;
    }
    return _cycleView;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.cycleView.height - 30, self.cycleView.width, 10)];
    }
    return _pageControl;
}
-(BHDescriptionView *)descriptionView{
    if (!_descriptionView) {
        _descriptionView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BHDescriptionView class]) owner:nil options:nil].firstObject;
    }
    return _descriptionView;
}


-(instancetype)init{
    if (self = [super initWithFrame:CGRectMake(0, -(BHScreenWidth + 150), BHScreenWidth, BHScreenWidth + 150)]) {
        [self addSubview:self.cycleView];
        [self addSubview:self.pageControl];
        [self addSubview:self.descriptionView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)setImageUrls:(NSArray<NSString *> *)imageUrls{
    _imageUrls = imageUrls;
    if (imageUrls.count == 0) {
        self.pageControl.hidden = YES;
    }else{
        self.pageControl.numberOfPages = imageUrls.count;
    }
    self.cycleView.imageUrls = imageUrls;
    [self.cycleView reloadData];
}

-(void)setTitleText:(NSString *)titleText{
    _titleText = titleText;
    self.descriptionView.titleLabel.text = titleText;
}
-(void)setPriceText:(NSString *)priceText{
    _priceText = priceText;
    self.descriptionView.priceLabel.text = priceText;
}
-(void)setDescriptionText:(NSString *)descriptionText{
    _descriptionText = descriptionText;
    self.descriptionView.descriptionLabel.text = descriptionText;
    [self.descriptionView layoutIfNeeded];
    self.descriptionView.frame = CGRectMake(0, self.cycleView.maxY, self.width, self.descriptionView.descriptionLabel.maxY + 10);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    NSInteger currentPage = offset / self.width;
    self.pageControl.currentPage = currentPage;
}

@end
