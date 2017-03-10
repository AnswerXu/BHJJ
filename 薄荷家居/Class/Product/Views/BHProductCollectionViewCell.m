//
//  BHProductCollectionViewCell.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHProductCollectionViewCell.h"
#import "BHLeftImageButton.h"
#import "BHProductModel.h"

@interface BHProductCollectionViewCell()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) BHLeftImageButton *praiseButton;
@end

static CGFloat const spacing = 10;
@implementation BHProductCollectionViewCell

#pragma mark-  懒加载
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = BHFontColor_normal;
    }
    return _titleLabel;
}
-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = BHFontColor_selected;
        _priceLabel.font = [UIFont systemFontOfSize:14];
    }
    return _priceLabel;
}
-(BHLeftImageButton *)praiseButton{
    if (!_praiseButton) {
        _praiseButton = [BHLeftImageButton buttonWithType:UIButtonTypeCustom];
        [_praiseButton setTitleColor:BHFontColor_normal forState:UIControlStateNormal];
        _praiseButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_praiseButton setImage:[UIImage imageNamed:@"icon_button_like"] forState:UIControlStateNormal];
    }
    return _praiseButton;
}

#pragma mark-  初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.praiseButton];
}

#pragma mark-  系统方法
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.layer.cornerRadius = 3;
    self.clipsToBounds = YES;
    
    
    self.imageView.frame = CGRectMake(0, 0, self.width, self.width);
    
    CGSize priceLabelSize = [self.priceLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    self.priceLabel.frame = CGRectMake(spacing, self.height - spacing - priceLabelSize.height, priceLabelSize.width, priceLabelSize.height);
    
    CGSize praiseButtonSize = [self.praiseButton sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    self.praiseButton.frame = CGRectMake(self.width - spacing - praiseButtonSize.width , self.priceLabel.y, praiseButtonSize.width , priceLabelSize.height);
    
    CGSize titleLabelSize = [self.titleLabel sizeThatFits:CGSizeMake(self.width - 2 * spacing, MAXFLOAT)];
    self.titleLabel.frame = CGRectMake(spacing, self.imageView.maxY + spacing, titleLabelSize.width, titleLabelSize.height);
}

#pragma mark-  set方法
-(void)setProductModel:(BHProductModel *)productModel{
    _productModel = productModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:productModel.cover_image_url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.titleLabel.text = productModel.name;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",productModel.price];
    [self.praiseButton setTitle:[NSString stringWithFormat:@"%ld",productModel.favorites_count] forState:UIControlStateNormal];
}

@end
