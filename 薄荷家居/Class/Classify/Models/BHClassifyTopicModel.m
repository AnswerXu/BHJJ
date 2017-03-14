//
//  BHClassifyTopicModel.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/7.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHClassifyTopicModel.h"

@implementation BHClassifyTopicModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id" : @"ID"}];
}

@end
