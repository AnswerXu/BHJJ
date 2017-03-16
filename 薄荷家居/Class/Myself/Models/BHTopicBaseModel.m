//
//  BHTopicBaseModel.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/16.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHTopicBaseModel.h"

@implementation BHTopicBaseModel


+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"ID"}];
}

@end
