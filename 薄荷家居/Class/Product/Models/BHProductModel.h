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
//id
@property (nonatomic,assign) NSInteger ID;
//商品详情地址
@property (nonatomic,copy) NSString *url;
//淘宝地址
@property (nonatomic,copy) NSString *purchase_url;

@end


/*
 {
 data =                 {
 "brand_id" = "<null>";
 "brand_order" = 0;
 "category_id" = "<null>";
 "cover_image_url" = "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150831/d1fbf6m6s_w.jpg-w720";
 "created_at" = 1441001347;
 description = "颜色超心水，湖水蓝搭配白色的墙壁，绝配哦~阳台灯光一般都会很暗，一串这样的彩灯，既能起到装饰作用，也很实用。";
 "editor_id" = 1024;
 "favorites_count" = 4789;
 id = 1144;
 "image_urls" =                     (
 "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150831/d1fbf6m6s_w.jpg-w720"
 );
 "is_favorite" = 0;
 name = "湖水绿棉线圆球彩灯串";
 "post_ids" =                     (
 );
 price = "35.14";
 "purchase_id" = 39121834560;
 "purchase_status" = 1;
 "purchase_type" = 1;
 "purchase_url" = "http://s.click.taobao.com/t?e=m%3D2%26s%3D%2FHrjRRF4G6kcQipKwQzePOeEDrYVVa64Qih%2F7PxfOKS5VBFTL4hn2a2jaQ927FGU%2FpU2SWJU0cJtabAtTg06px%2FVXctKptzdeP1OMBEVuKWDXUm1ysSg%2B79yb5fgD6Zv1aNkTR84XM04KSD%2FjpIbDnEqY%2Bakgpmw";
 "subcategory_id" = "<null>";
 "updated_at" = 1441001347;
 url = "http://bohejiaju.liwushuo.com/items/1144";
 };
 type = item;
 },
 */
