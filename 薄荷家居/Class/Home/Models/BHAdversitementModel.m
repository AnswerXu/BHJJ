//
//  BHAdversitementModel.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHAdversitementModel.h"

@implementation BHAdversitementModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"id" : @"ID",@"target.title":@"target_title"}];
}

-(void)setTarget:(NSDictionary *)target{
    _target = target;
    self.target_title = target[@"title"];
}

@end
