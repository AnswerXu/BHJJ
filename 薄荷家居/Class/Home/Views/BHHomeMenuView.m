//
//  BHHomeMenuView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHHomeMenuView.h"
#import "BHMenuItem.h"

@interface BHHomeMenuView()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong) UIView *scrollLine;
@property (nonatomic,strong) UIView *line;
@end

static CGFloat const itmeSpacing = 20;

@implementation BHHomeMenuView

#pragma mark-  懒加载
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView addSubview:self.scrollLine];
    }
    return _scrollView;
}
-(UIButton *)moreButton{
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] init];
        [_moreButton setImage:[UIImage imageNamed:@"icon_ordercenter_arrow_down"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"icon_ordercenter_arrow_up"] forState:UIControlStateSelected];
        [_moreButton addTarget:self action:@selector(showMoreAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}
-(UIView *)scrollLine{
    if (!_scrollLine) {
        _scrollLine = [[UIView alloc] init];
        _scrollLine.backgroundColor = BHFontColor_selected;
    }
    return _scrollLine;
}
-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _line;
}
-(NSMutableArray<BHMenuItem *> *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.image = [[UIImage imageNamed:@"bg_navigationBar_white"] stretchableImageWithLeftCapWidth:0.5 topCapHeight:5];
        self.userInteractionEnabled = YES;
        [self addSubview:self.scrollView];
        [self addSubview:self.moreButton];
        [self addSubview:self.line];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat moreButtonWidth = self.height - 10;
    self.moreButton.frame = CGRectMake(self.width - moreButtonWidth - 10, 5, moreButtonWidth, moreButtonWidth);
    self.scrollView.frame = CGRectMake(0, 0, self.moreButton.x - 10, self.height - 0.5);
    self.line.frame = CGRectMake(0, self.scrollView.maxY, self.width, 0.5);
    
    if (![_delegate respondsToSelector:@selector(numberOfColumnsInMenuView:)])  return;
    if (![_delegate respondsToSelector:@selector(menuView:itemForColumnAtIndexPath:)]) return;
    
    NSInteger count = [_delegate numberOfColumnsInMenuView:self];
    for (NSInteger i=0; i<count; i++) {
        BHMenuItem *item = [_delegate menuView:self itemForColumnAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        if (!item) continue;
        CGFloat previousMaxX = (i == 0) ? 0 : self.items[i-1].maxX;
        CGFloat space = (i==0) ? itmeSpacing * 0.5 : itmeSpacing;
        item.frame = CGRectMake(space + previousMaxX, 0, [item sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)].width, self.height);
        [self.scrollView addSubview:item];
        [self.items addObject:item];
    }
    
    self.scrollLine.frame = CGRectMake(self.items.firstObject.x, self.items.firstObject.height - 2, self.items.firstObject.width, 2);
}

#pragma mark-  事件监听
-(void)showMoreAction:(UIButton *)sender{
    sender.selected = !sender.selected;
}

-(void)scrollLineAnimationWithIndex:(NSInteger)index{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = self.scrollLine.frame;
        rect.origin.x = self.items[index].x;
        rect.size.width = self.items[index].width;
        self.scrollLine.frame = rect;
    }];
}

@end
