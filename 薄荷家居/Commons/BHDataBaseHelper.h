//
//  BHDataBaseHelper.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/16.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BHTopicBaseModel;
@interface BHDataBaseHelper : NSObject

+(instancetype)helper;

-(void)writeDatasWithCollectTopicModel:(BHTopicBaseModel *)model;
-(NSArray<BHTopicBaseModel *> *)getAllDatasWithCollectTopicModels;
-(void)deleteDatasWithCollectTopicModel:(BHTopicBaseModel *)model;
-(BOOL)isCollectedWithPrimaryKey:(NSString *)key;
@end
