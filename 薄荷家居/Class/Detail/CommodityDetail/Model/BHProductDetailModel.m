//
//  BHProductDetailModel.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/17.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHProductDetailModel.h"

@implementation BHProductDetailModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description" : @"descript",@"id" : @"ID"}];
}


@end
