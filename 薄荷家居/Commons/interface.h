//
//  interface.h
//  薄荷家居
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#ifndef _____interface_h
#define _____interface_h


//薄荷家居

#define kCChosen @" http://api.bohejiaju.com/v2/channels/preset?gender=1&generation=1"
//精选
//http://api.bohejiaju.com/v1/banners?channel=iOS
#define kStories @"http://api.bohejiaju.com/v1/banners?channel=iOS"

//http://api.bohejiaju.com/v1/channels/4/items?gender=1&generation=1&limit=20&offset=20
#define kArticle @"http://api.bohejiaju.com/v1/channels/4/items" //offset：从第几条开始加载；limit：每次加载多少条

//卧室
//http://api.bohejiaju.com/v1/channels/13/items?limit=20&offset=0
#define kBedroom @"http://api.bohejiaju.com/v1/channels/13/items"

//书房
//http://api.bohejiaju.com/v1/channels/16/items?limit=20&offset=20
#define kStudy @"http://api.bohejiaju.com/v1/channels/16/items"

//厨房
//http://api.bohejiaju.com/v1/channels/12/items?limit=20&offset=20
#define kKitchen @"http://api.bohejiaju.com/v1/channels/12/items"

//客厅
//http://api.bohejiaju.com/v1/channels/15/items?limit=20&offset=20
#define kLivingRoom @"http://api.bohejiaju.com/v1/channels/15/items"

//卫浴
//http://api.bohejiaju.com/v1/channels/14/items?limit=20&offset=20
#define kSanitation @"http://api.bohejiaju.com/v1/channels/14/items"


//点击详情
//http://api.bohejiaju.com/v1/posts/%ld"  //参数为id
#define kCChosenDetail @"http://api.bohejiaju.com/v1/posts/%ld"  //参数为id
//评论
//http://api.bohejiaju.com/v1/posts/307/comments?limit=20&offset=20
#define kComment @"http://api.bohejiaju.com/v1/posts/307/comments?limit=20&offset=%ld"

/***********************************************************/

//单品
//http://api.bohejiaju.com/v2/items?gender=1&generation=1&limit=20&offset=0
#define KProduct @"http://api.bohejiaju.com/v2/items"

//图文介绍
#define kOddIntroduce @"http://api.bohejiaju.com/v2/items/%ld"  //参数id
//评论
#define kOddComment @"http://api.bohejiaju.com/v2/items/1146/comments?limit=20&offset=%ld"

//http://api.bohejiaju.com/v1/posts/4545/comments?limit=20&offset=0


/***********************************************************/

//分类
//地点和品类
#define kAll @"http://api.bohejiaju.com/v2/channel_groups/all"

//专题合集
//http://api.bohejiaju.com/v1/collections?limit=6&offset=0
#define kSpecialTopic @"http://api.bohejiaju.com/v1/collections"

//http://api.bohejiaju.com/v1/collections/18/posts?gender=1&generation=1&limit=20&offset=0
#define kTopicAll @"http://api.bohejiaju.com/v1/collections/%ld/posts?gender=1&generation=1&limit=20&offset=0"

//cell
//全部专题
#define kTopicCell @"http://api.bohejiaju.com/v1/channel_groups/all"
/*
 餐具		http://api.bohejiaju.com/v1/channels/17/items?limit=20&offset=0
 灯具		http://api.bohejiaju.com/v1/channels/18/items?limit=20&offset=0
 轻松家务		http://api.bohejiaju.com/v1/channels/19/items?limit=20&offset=0
 工作旅行		http://api.bohejiaju.com/v1/channels/20/items?limit=20&offset=0
*/

//餐具
#define kTableware @"http://api.bohejiaju.com/v1/channels/17/items"
//灯具
#define kLamps @"http://api.bohejiaju.com/v1/channels/18/items"
//轻松家务
#define kHomework @"http://api.bohejiaju.com/v1/channels/19/items"
//工作旅行
#define kTravel @"http://api.bohejiaju.com/v1/channels/20/items"


//搜索
//商品
//http://api.bohejiaju.com/v1/search/item?keyword=&limit=20&offset=0&sort=
#define kGoods @"http://api.bohejiaju.com/v1/search/item?keyword=%@&limit=20&offset=%ld&sort="
//专题
//http://api.bohejiaju.com/v2/search/post?keyword=AF&sort=&offset=0&limit=20
#define kSTopic @"http://api.bohejiaju.com/v2/search/post?keyword=%@&sort=&offset=%ld&limit=20"
//搜索详情
//专题
#define kSGDetail @"http://api.bohejiaju.com/v1/posts/%ld"
#define kSTDetail @"http://api.bohejiaju.com/v2/items/%ld"


//我
//喜欢的商品
//http://api.bohejiaju.com/v1/users/me/favorite_lists?limit=20&offset=0
//喜欢的专题
//http://api.bohejiaju.com/v1/users/me/post_likes?limit=20&offset=0
#define kMyselfCollectTopic  @"http://api.bohejiaju.com/v1/users/me/post_likes?limit=20&offset=0"


//性别、职业选择
//http://api.bohejiaju.com/v2/channels/preset?gender=2&generation=1

#define kGender @"gender"
#define kGeneration @"generation"
#define kLimit @"limit"
#define kOffset @"offset"






#endif
