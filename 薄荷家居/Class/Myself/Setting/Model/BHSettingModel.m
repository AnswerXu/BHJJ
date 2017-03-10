//
//  BHSettingModel.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/10.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHSettingModel.h"

@implementation BHSettingModel

-(instancetype)initSettingModelWithIndexPath:(NSIndexPath *)indexPath{
    if (self = [super init]) {
        [UIImage imageNamed:@"icon_mine_wallet"];
        if (indexPath.section == 0) {
            self.icon = [UIImage imageNamed:@[@"icon_mine_member",@"icon_mine_collection",@"icon_mine_membercard"][indexPath.row]];
            self.title = @[@"邀请好友使用薄荷家居",@"给我们评分吧",@"意见反馈"][indexPath.row];
        }else if (indexPath.section == 1){
            self.icon = [UIImage imageNamed:@[@"icon_mine_membercenter",@"icon_mine_customerService",@"icon_mine_wallet"][indexPath.row]];
            self.title = @[@"我的身份",@"接受消息提醒",@"清除缓存"][indexPath.row];
        }else{
            self.icon = [UIImage imageNamed:@"icon_mine_aboutmeituan"];
            self.title = @"关于薄荷家居";
        }
    }
    return self;
}

@end
