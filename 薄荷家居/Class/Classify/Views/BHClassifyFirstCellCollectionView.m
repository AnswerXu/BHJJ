//
//  BHClassifyFirstCellCollectionView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHClassifyFirstCellCollectionView.h"
#import "BHClassifyTopicModel.h"

@interface BHClassifyFirstCellCollectionView()<UICollectionViewDataSource>
@end

@interface BHClassifyFirstCollectionViewFlowLayout : UICollectionViewFlowLayout
@end
@implementation BHClassifyFirstCollectionViewFlowLayout
-(void)prepareLayout{
    self.itemSize = CGSizeMake(BHClassifyItemWidth * 2, BHClassifyItemWidth);
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}
@end

@interface BHClassifyFirstCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@end
@implementation BHClassifyFirstCollectionViewCell
#pragma mark-  懒加载
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.cornerRadius = 5;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.width, self.height);
}
@end

static NSString *const classifyFirstCollectionViewCellIdent = @"classifyFirstCollectionViewCellIdent";
@implementation BHClassifyFirstCellCollectionView
-(instancetype)init{
    if (self = [super initWithFrame:CGRectZero collectionViewLayout:[[BHClassifyFirstCollectionViewFlowLayout alloc] init]]) {
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        self.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
        [self registerClass:[BHClassifyFirstCollectionViewCell class] forCellWithReuseIdentifier:classifyFirstCollectionViewCellIdent];
        self.showsHorizontalScrollIndicator = NO;
        self.tag = 1000;
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _topicModels.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BHClassifyFirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:classifyFirstCollectionViewCellIdent forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_topicModels[indexPath.item].banner_image_url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    return cell;
}



@end
