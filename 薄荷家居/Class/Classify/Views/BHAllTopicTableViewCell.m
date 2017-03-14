//
//  BHAllTopicTableViewCell.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/13.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHAllTopicTableViewCell.h"
#import "BHClassifyTopicModel.h"

@interface BHAllTopicTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@end

@implementation BHAllTopicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(void)setTopicModel:(BHClassifyTopicModel *)topicModel{
    _topicModel = topicModel;
    self.titleLab.text = topicModel.title;
    self.detailLab.text = topicModel.subtitle;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:topicModel.cover_image_url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
}

@end
