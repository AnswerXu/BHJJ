//
//  BHClassifyItemModel.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHClassifyItemModel : JSONModel
@property (nonatomic,copy) NSString *icon_url;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger group_id;
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,assign) NSInteger items_count;
@property (nonatomic,assign) NSInteger order;
@property (nonatomic,assign) NSInteger status;

@end

/*
 {
 "group_id" = 1;
 "icon_url" = "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150715/ojv4xts7z.png-pw144";
 id = 12;
 "items_count" = 42;
 name = "厨房";
 order = 0;
 status = 0;
 },
 */
