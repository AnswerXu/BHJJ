//
//  BHDataBaseHelper.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/16.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHDataBaseHelper.h"
#import "FMDB.h"
#import "BHTopicBaseModel.h"

@interface BHDataBaseHelper()
@property (nonatomic,copy) FMDatabase *database;
@end

@implementation BHDataBaseHelper
+(instancetype)helper{
    static BHDataBaseHelper *_helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _helper = [[self alloc] init];
    });
    return _helper;
}

-(instancetype)init{
    if (self = [super init]) {
        NSString *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSLog(@"%@",document);
        NSString *dbPath = [document stringByAppendingPathComponent:@"datas.db"];
        _database = [FMDatabase databaseWithPath:dbPath];
        if ([_database open]) {
            //创建表(我喜欢的专题)
            NSString *sql = @"create table if not exists collect_topics(id text primary key, title text, likes_count text, cover_image_url text, content_url text)";
            BOOL isSuccess = [_database executeUpdate:sql];
            if (isSuccess) {
                NSLog(@"我喜欢的专题数据存储表创建-成功");
            }else{
                NSLog(@"我喜欢的专题数据存储表创建-失败");
            }
        }
        //关闭表格
        [_database close];
    }
    return self;
}

#pragma mark-  保存“我喜欢的专题”数据模型
-(void)writeDatasWithCollectTopicModel:(BHTopicBaseModel *)model{
    [_database open];
    NSString *sql = @"insert into collect_topics values(?, ?, ?, ?, ?)";
    NSString *likes_count = [NSString stringWithFormat:@"%lld",model.likes_count];
    NSString *ID = [NSString stringWithFormat:@"%ld",model.ID];
    BOOL isSuccess = [_database executeUpdate:sql, ID, model.title, likes_count, model.cover_image_url, model.content_url];
    if (isSuccess) {
        NSLog(@"BHHomeDataModel写入-成功");
    }else{
        NSLog(@"BHHomeDataModel写入-失败");
    }
}
#pragma mark-  读取所有“我喜欢的专题”数据模型
-(NSArray<BHTopicBaseModel *> *)getAllDatasWithCollectTopicModels{
    NSString *sql = @"select * from collect_topics";
    [_database open];
    NSMutableArray *datas = [NSMutableArray array];
    
    FMResultSet *result = [_database executeQuery:sql];
    while ([result next]) {
        NSString *ID = [result stringForColumn:@"ID"];
        NSString *title = [result stringForColumn:@"title"];
        NSString *likes_count = [result stringForColumn:@"likes_count"];
        NSString *image = [result stringForColumn:@"cover_image_url"];
        NSString *url = [result stringForColumn:@"content_url"];
        
        BHTopicBaseModel *model = [[BHTopicBaseModel alloc] init];
        model.ID = [ID integerValue];
        model.title = title;
        model.likes_count = [likes_count integerValue];
        model.cover_image_url = image;
        model.content_url = url;
        [datas addObject:model];
    }
    return datas;
}

#pragma mark-  根据id读取“我喜欢的专题”数据模型
-(BOOL)isCollectedWithPrimaryKey:(NSString *)key{
    NSString *sql = @"select * from collect_topics";
    [_database open];
    
    FMResultSet *result = [_database executeQuery:sql];
    while ([result next]) {
        NSString *ID = [result stringForColumn:@"ID"];
        if ([ID isEqualToString:key]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark-  删除“我喜欢的专题”数据模型
-(void)deleteDatasWithCollectTopicModel:(BHTopicBaseModel *)model{
    [_database open];
    NSString *sql = @"delete from collect_topics where id = ?";
    BOOL isSuccess = [_database executeUpdate:sql,@(model.ID)];
    if (isSuccess) {
        NSLog(@"删除BHHomeDataModel-成功");
    }else{
        NSLog(@"删除BHHomeDataModel-失败");
    }
    [_database close];
}



@end
