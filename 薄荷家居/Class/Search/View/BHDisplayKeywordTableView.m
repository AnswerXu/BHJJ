//
//  BHDisplayKeywordTableView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHDisplayKeywordTableView.h"
#import "BHKeywordCollectionView.h"

@interface BHDisplayKeywordTableViewCell : UITableViewCell
@property (nonatomic,strong) BHKeywordCollectionView *collectionView;
@end

@implementation BHDisplayKeywordTableViewCell
-(BHKeywordCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[BHKeywordCollectionView alloc] initWithFrame:CGRectZero];
    }
    return _collectionView;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.collectionView];
        self.textLabel.font = [UIFont systemFontOfSize:12];
        self.textLabel.textColor = BHFontColor_normal;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    extern CGFloat const edgeSpacing;
    extern CGFloat const itemHeight;
    self.textLabel.frame = CGRectMake(edgeSpacing, 0, self.width, itemHeight);
    self.collectionView.frame = CGRectMake(0, self.textLabel.maxY, self.width, self.height - self.textLabel.maxY);
}
@end

@interface BHDisplayKeywordTableView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy) NSMutableArray<NSArray *> *sectionArr;
@end

static NSString *const  displayKeywordTableViewCellIdent = @"displayKeywordTableViewCellIdent";
@implementation BHDisplayKeywordTableView
-(NSMutableArray<NSArray *> *)sectionArr{
    if (!_sectionArr) {
        _sectionArr = [NSMutableArray array];
        NSArray *keywords = @[@"戒指",@"沙发",@"创意",@"宜家",@"北欧",@"阳台",@"桌子",@"衣柜",@"台灯",@"茶几",@"拖鞋",@"艺术"];
        [_sectionArr addObject:keywords];
    }
    return _sectionArr;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[BHDisplayKeywordTableViewCell class] forCellReuseIdentifier:displayKeywordTableViewCellIdent];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

#pragma mark-  数据源代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] init];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sectionArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BHDisplayKeywordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:displayKeywordTableViewCellIdent];
    cell.collectionView.sectionDatas = self.sectionArr[indexPath.section];
    cell.textLabel.text = indexPath.row == 0 ? @"大家都在搜" : @"搜索历史";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightWithDatas:self.sectionArr[indexPath.section]];
}
-(CGFloat)cellHeightWithDatas:(NSArray *)datas{
    if (datas.count == 0) return 0;
    extern NSInteger const itemColumn;
    extern CGFloat const itemHeight;
    extern CGFloat const minimumLineSpacing;
    NSInteger rows = datas.count % itemColumn == 0 ? datas.count / itemColumn : datas.count / itemColumn + 1;
    CGFloat height = rows == 1 ? itemHeight : (rows - 1) * minimumLineSpacing + rows * itemHeight;
    return height + itemHeight;
}

@end
