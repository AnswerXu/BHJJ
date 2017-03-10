//
//  BHClassifyTopicModel.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHClassifyTopicModel : JSONModel
@property (nonatomic,copy) NSString *banner_image_url;
@property (nonatomic,copy) NSString *cover_image_url;
@property (nonatomic,assign) long long created_at;
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,assign) NSInteger posts_count;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) long long updated_at;

@end


/*
 {
 "banner_image_url" = "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150820/toh6ovphc.jpg-w300";
 "cover_image_url" = "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150820/bwwcm6jq0.jpg-w720";
 "created_at" = 1440032828;
 id = 8;
 "posts_count" = 8;
 status = 0;
 subtitle = "拯救凌乱星人";
 title = "省心收纳";
 "updated_at" = 1440032828;
 }
 */
