//
//  BHProductModel.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BHProductModel : JSONModel
//商品id
@property (nonatomic,copy) NSString *purchase_id;
//商品图片地址
@property (nonatomic,copy) NSString *cover_image_url;
//商品标题
@property (nonatomic,copy) NSString *name;
//商品价格
@property (nonatomic,copy) NSString *price;
//点赞数量
@property (nonatomic,assign) NSInteger favorites_count;
//是否点赞
@property (nonatomic,assign) BOOL is_favorite;

@end
