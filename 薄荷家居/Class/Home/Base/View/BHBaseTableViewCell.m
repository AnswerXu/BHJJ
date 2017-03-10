//
//  BHBaseTableViewCell.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHBaseTableViewCell.h"
#import "BHHomeDataModel.h"
#import "BHLeftImageButton.h"

@interface BHBaseTableViewCell()
@property (nonatomic,strong) BHLeftImageButton *praiseButton;
@end
static CGFloat const edgeSpacing = 10;
@implementation BHBaseTableViewCell

-(BHLeftImageButton *)praiseButton{
    if (!_praiseButton) {
        _praiseButton = [BHLeftImageButton buttonWithType:UIButtonTypeCustom];
        [_praiseButton setImage:[UIImage imageNamed:@"icon_button_like"] forState:UIControlStateNormal];
        [_praiseButton setImage:[UIImage imageNamed:@"icon_button_liked"] forState:UIControlStateSelected];
        [_praiseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _praiseButton.titleLabel.font = [UIFont systemFontOfSize:10];
        _praiseButton.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.400];
        _praiseButton.layer.cornerRadius = 10;
        [_praiseButton addTarget:self action:@selector(praiseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praiseButton;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:16];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        self.imageView.layer.cornerRadius = 5;
        self.imageView.userInteractionEnabled = YES;
        [self.imageView addSubview:self.praiseButton];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView insertSubview:self.textLabel aboveSubview:self.imageView];
    self.imageView.frame = CGRectMake(edgeSpacing, edgeSpacing, self.width - 2 * edgeSpacing, self.height -  edgeSpacing);
    CGSize textLabelSize = [self.textLabel sizeThatFits:CGSizeMake(self.imageView.width, MAXFLOAT)];
    self.textLabel.frame = CGRectMake(edgeSpacing * 2, self.imageView.maxY - edgeSpacing - textLabelSize.height, self.imageView.width - 2 * edgeSpacing, textLabelSize.height);
    
    CGSize praiseButtonSize = [self.praiseButton sizeThatFits:CGSizeMake(MAXFLOAT, 100)];
    CGFloat praiseWidth = praiseButtonSize.width + 10;
    self.praiseButton.frame = CGRectMake(self.imageView.width - praiseWidth - 10, 10, praiseWidth, 20);
}

-(void)setDataModel:(BHHomeDataModel *)dataModel{
    _dataModel = dataModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:dataModel.cover_image_url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.textLabel.text = dataModel.title;
    self.praiseButton.selected = dataModel.liked;
    [self.praiseButton setTitle:[NSString stringWithFormat:@"%lld",dataModel.likes_count] forState:UIControlStateNormal];
}

#pragma mark-  事件监听
-(void)praiseButtonAction:(BHLeftImageButton *)sender{
    sender.selected = !sender.selected;
    _dataModel.liked = sender.selected;
}

@end
