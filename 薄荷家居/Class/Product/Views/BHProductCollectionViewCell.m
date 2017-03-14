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

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet BHLeftImageButton *praiseButton;
@end

@implementation BHProductCollectionViewCell

-(void)awakeFromNib{
    [super awakeFromNib];
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
