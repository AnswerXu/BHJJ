//
//  BHTopicBaseModel.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/16.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BHTopicBaseModel : JSONModel
@property (nonatomic,strong) NSString *content_url;
@property (nonatomic,strong) NSString *cover_image_url;
@property (nonatomic,assign) NSInteger ID;//映射为id；
@property (nonatomic,assign) BOOL liked;
@property (nonatomic,assign) long long likes_count;
@property (nonatomic,strong) NSString *title;
@end
