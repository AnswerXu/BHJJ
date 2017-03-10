//
//  BHMyCollectTableView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/9.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHMyselfCollectTableView.h"
#import "BHMyselfSegmentView.h"
#import "BHMyselfHeaderView.h"

@interface BHMyselfCollectTableView()<UITableViewDelegate,UITableViewDataSource>
@end

@interface MyselfCollectGoodsCell : UITableViewCell
@end
@implementation MyselfCollectGoodsCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.textLabel.textColor = BHFontColor_normal;
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
        self.detailTextLabel.textColor = [UIColor colorWithWhite:0.933 alpha:1.000];
        self.imageView.layer.cornerRadius = 2;
        self.imageView.clipsToBounds = YES;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(10, 10, self.height - 20, self.height - 20);
    CGSize textLabelSize = [self.textLabel sizeThatFits:CGSizeMake(self.width , MAXFLOAT)];
    self.textLabel.frame = CGRectMake(self.imageView.maxX + 10, self.imageView.centerY - 5 - textLabelSize.height, textLabelSize.width, textLabelSize.height);
    CGSize detailTextLabelSize = [self.detailTextLabel sizeThatFits:CGSizeMake(self.width , MAXFLOAT)];
    self.detailTextLabel.frame = CGRectMake(self.textLabel.x, self.imageView.centerY + 5, detailTextLabelSize.width, detailTextLabelSize.height);
}
@end

@interface MyselfCollectTopicCell : UITableViewCell
@end
@implementation MyselfCollectTopicCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.textLabel.textColor = BHFontColor_normal;
        self.textLabel.numberOfLines = 2;
        self.imageView.layer.cornerRadius = 2;
        self.imageView.clipsToBounds = YES;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(10, 10, self.height - 10, self.height - 20);
    CGSize textLabelSize = [self.textLabel sizeThatFits:CGSizeMake(self.width , MAXFLOAT)];
    self.textLabel.frame = CGRectMake(self.imageView.maxX + 10, self.imageView.minY + 5, self.width - 10 - self.imageView.maxX, textLabelSize.height);
}
@end


static NSString *const collectGoodsCellIdent = @"collectGoodsCellIdent";
static NSString *const collectTopicCellIdent = @"collectTopicCellIdent";
@implementation BHMyselfCollectTableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        [self setupCollectTableView];
    }
    return self;
}

-(void)setupCollectTableView{
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[MyselfCollectGoodsCell class] forCellReuseIdentifier:collectGoodsCellIdent];
    [self registerClass:[MyselfCollectTopicCell class] forCellReuseIdentifier:collectTopicCellIdent];
}

#pragma mark-  UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _selectedStyle == 0 ? 20 : _topicDatas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectedStyle == 0) {
        MyselfCollectGoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:collectGoodsCellIdent];
        return goodsCell;
    }else{
        MyselfCollectTopicCell *topicCell = [tableView dequeueReusableCellWithIdentifier:collectTopicCellIdent];
        return topicCell;
    }
}

#pragma mark-  UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_collectdelegate respondsToSelector:@selector(collectTableView:didSelectRowAtIndexPath:)]) {
        [_collectdelegate collectTableView:self didSelectRowAtIndexPath:indexPath];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    extern CGFloat headerViewHeight;
    if (offsetY < -headerViewHeight - 20 - 120) {
        self.contentOffset = CGPointMake(0, -headerViewHeight - 20 -100);
        return;
    }
    if (offsetY > -headerViewHeight + 50 + 64) {
        self.contentOffset = CGPointMake(0, -headerViewHeight + 50 + 64);
        return;
    }
    if (offsetY < -headerViewHeight - 20) {
        CGRect rect = self.headerView.frame;
        rect.size.height = headerViewHeight + fabs(offsetY + headerViewHeight + 20);
        rect.origin.y = -headerViewHeight - fabs(offsetY + headerViewHeight + 20);
        rect.size.width = BHScreenWidth + BHScreenWidth / headerViewHeight * fabs(offsetY + headerViewHeight + 20);
        rect.origin.x = - (rect.size.width - BHScreenWidth) * 0.5;
        self.headerView.frame = rect;
    }
}


@end
