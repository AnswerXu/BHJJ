//
//  BHHomeDataModel.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BHHomeDataModel : JSONModel

@property (nonatomic,strong) NSString *content_url;
@property (nonatomic,strong) NSString *cover_image_url;
@property (nonatomic,assign) long long created_at;
@property (nonatomic,assign) NSInteger ID;//映射为id；
@property (nonatomic,assign) NSArray *labels;
@property (nonatomic,assign) BOOL liked;
@property (nonatomic,assign) long long likes_count;
@property (nonatomic,assign) long long published_at;
@property (nonatomic,strong) NSString *share_msg;
@property (nonatomic,strong) NSString *short_title;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,assign)long long updated_at;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSArray *label_ids;

@end

/*
 {
 "content_url" = "http://bohejiaju.liwushuo.com/posts/4545/content";
 "cover_image_url" = "http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151217/4a9nyyog4.jpg-w720";
 "created_at" = 1451174400;
 "editor_id" = "<null>";
 id = 4545;
 labels =                 (
 );
 liked = 0;
 "likes_count" = 6423;
 "published_at" = 1451174400;
 "share_msg" = "最近出了超多美食节目，对于真正的吃货行家来说，最关心的显然不是那些明星们，而是他们使用的厨房工具，毕竟&ldquo;工欲善其事必先利其器&rdquo;嘛！下面我为各位大厨推荐几款厨房好帮手，有了这些神器，相信你可以做出超级好吃的美味哦~人生在世，吃点好的很有必要！这些厨房美食小利器，相信也能帮到你！";
 "short_title" = "美食炊具";
 status = 0;
 template = "";
 title = "美食神器强助攻，超级美味也能亲手烹饪";
 type = post;
 "updated_at" = 1450330467;
 url = "http://bohejiaju.liwushuo.com/posts/4545";
 },
 */
