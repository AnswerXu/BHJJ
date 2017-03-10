//
//  BHMyselfSegmentView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/9.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHMyselfSegmentView.h"

@interface BHMyselfSegmentView()
@property (nonatomic,copy) NSMutableArray<UIButton *> *segmentItems;
@property (nonatomic,strong) UIView *backgroundView;
@property (nonatomic,strong) UIView *scrollLine;
@property (nonatomic,strong) UIView *topLine;
@property (nonatomic,strong) UIView *bottomLine;
@end

@implementation BHMyselfSegmentView
-(UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = [UIColor whiteColor];
    }
    return _backgroundView;
}
-(UIView *)scrollLine{
    if (!_scrollLine) {
        _scrollLine = [[UIView alloc] init];
    }
    return _scrollLine;
}
-(UIView *)topLine{
    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.backgroundColor = BHLineColor_normal;
    }
    return _topLine;
}
-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = BHLineColor_normal;
    }
    return _bottomLine;
}
-(NSMutableArray<UIButton *> *)segmentItems{
    if (!_segmentItems) {
        _segmentItems = [NSMutableArray array];
    }
    return _segmentItems;
}

-(instancetype)init{
    if (self = [super init]) {
        [self setupItems];
    }
    return self;
}

-(void)setupItems{
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:self.backgroundView];
    [self addSubview:self.topLine];
    [self addSubview:self.bottomLine];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    if(![_dataSource respondsToSelector:@selector(numberOfColumnInSegmentView:)]) return;
    if(![_dataSource respondsToSelector:@selector(segmentView:ItemForColumnAtIndexPath:)]) return;
    
    [self.backgroundView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.segmentItems removeAllObjects];
    
    self.backgroundView.frame = CGRectMake(0, 0, self.width, self.height);
    self.topLine.frame = CGRectMake(0, 0, self.width, 0.5);
    self.bottomLine.frame = CGRectMake(0, self.height - 0.5, self.width, 0.5);
    
    NSInteger count = [_dataSource numberOfColumnInSegmentView:self];
    CGFloat itemWidth = (self.backgroundView.width - 0.5 * (count - 1)) / count;
    for (NSInteger i=0; i<count; i++) {
        UIButton *item = [_dataSource segmentView:self ItemForColumnAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        if(!item) continue;
        item.frame = CGRectMake(i*(itemWidth + 0.5), 0.5, itemWidth, self.backgroundView.height - 1);
        [self.backgroundView addSubview:item];
        [self.segmentItems addObject:item];
        
        if(i== 0) continue;
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(self.segmentItems[i-1].maxX, 0, 0.5, self.backgroundView.height)];
        line.backgroundColor = BHLineColor_normal;
        [self.backgroundView addSubview:line];
    }
}

@end
