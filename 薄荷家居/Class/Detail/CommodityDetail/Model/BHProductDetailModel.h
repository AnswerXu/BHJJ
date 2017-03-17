//
//  BHProductDetailModel.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/17.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHProductDetailModel : JSONModel

//评论数量
@property (nonatomic,assign) NSInteger comments_count;
//商品描述
@property (nonatomic,copy) NSString *descript;

@property (nonatomic,copy) NSString *detail_html;

@property (nonatomic,assign) BOOL favorited;

@property (nonatomic,assign) NSInteger favorites_count;

@property (nonatomic,assign) NSInteger ID;

@property (nonatomic,copy) NSArray *image_urls;

@property (nonatomic,assign) BOOL liked;

@property (nonatomic,assign) NSInteger likes_count;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *price;

@end


/*
 {
 "code": 200,
 "data": {
 "authentic": null,
 "brand_id": null,
 "brand_order": 0,
 "category_id": null,
 "comments_count": 16,
 "cover_image_url": "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/rlie2wnem.jpg-w720",
 "created_at": 1449229437,
 "description": "浪漫雪景，冬意绒绒，王妃梳为你谱写一首来自英格兰的温情赞曲。红艳如火的米字旗与银白唯美的雪花相结合。化作萦绕你的情感音符，围绕在你的身边，温和打理柔亮的秀发，梳出每一丝精彩与美丽。",
 "detail_html": "<!doctype html>
 <html>
 <head>
 <meta charset=\"UTF-8\">
 <meta name=\"renderer\" content=\"webkit\">
 <meta name=\"format-detection\" content=\"telephone=no\">
 <meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\">
 <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">
 <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">
 <meta id=\"vp\" name=\"viewport\" content=\"width=device-width, user-scalable=no,maximum-scale=1.0,initial-scale=1\">
	<title>商品详情</title>
 <link rel=\"stylesheet\" type=\"text/css\" href=\"http://7xk0oy.com2.z0.glb.qiniucdn.com/static/web/apps/bohejiaju/css/item_8d81c20.css\">
 
 
 </head>
 <body>
 <p><img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/pfkd46tz6.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/2gez2mhpe.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/076foi7ll.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/ttd19x5b5.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/kqjhslvpe.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/xf1h38u59.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/m015g3x6g.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/jh6p35ubk.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/y6q3nms56.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/39wlgr0sz.jpg\" /> <img src=\"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151204/i8g8od3vr.jpg\" /></p>
 </body>
 </html>",
 "editor_id": 1023,
 "favorited": false,
 "favorites_count": 219,
 "id": 4105,
 "image_urls": [],
 "liked": false,
 "likes_count": 219,
 "name": "Tangle Teezer·圣诞节礼盒王妃梳",
 "post_ids": [ ],
 "price": "199.00",
 "purchase_id": "524760779546",
 "purchase_shop_id": null,
 "purchase_status": 1,
 "purchase_type": 2,
 "purchase_url": "http://s.click.taobao.com/t?sche=bohejiaju&e=m%3D2%26s%3DCz8HYcNqMEkcQipKwQzePOeEDrYVVa64yK8Cckff7TVRAdhuF14FMapATM1yciEWlovu%2FCElQOutgmtnxDX9deVMA5qBABUs5mPg1WiM1P5OS0OzHKBZzW1e2y4p13L5kcDQXAZkj9Tz4FpSLwLX5mdmXDp%2FWqqktFBlVsq%2FIE8%3D",
 "shares_count": 4,
 "source": {
    "button_title": "去天猫购买",
    "name": "天猫",
    "page_title": "商品详情",
    "type": "tmall"
 },
 "subcategory_id": null,
 "updated_at": 1449229437,
 "url": "http://bohejiaju.liwushuo.com/items/4105"
 },
 "message": "OK"
 }

 */
