//
//  BHAdversitementModel.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BHAdversitementModel : JSONModel
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,copy) NSString *image_url;
@property (nonatomic,assign) NSInteger target_id;
@end

/*
 {
 "channel": "all",
 "id": 21,
 "image_url": "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151104/69t9ogkgl.jpg-w720",
 "order": 3,
 "status": 0,
 "target": {
    "banner_image_url": "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151104/s8a68uk0k.jpg-w300",
    "cover_image_url": "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151104/84zzlpbwy.jpg-w720",
    "created_at": 1446627781,
    "id": 19,
    "posts_count": 3,
    "status": 0,
    "subtitle": null,
    "title": "\u6ca1\u4eba\u80fd\u591f\u62d2\u7edd\u7684zakka\u98ce\u5bb6\u5c45",
    "updated_at": 1446627781
 },
 "target_id": 19,
 "target_url": "",
 "type": "collection"
 },
 */
