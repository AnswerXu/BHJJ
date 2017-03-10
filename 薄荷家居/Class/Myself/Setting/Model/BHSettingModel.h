//
//  BHSettingModel.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/10.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHSettingModel : NSObject
@property (nonatomic,copy) UIImage *icon;
@property (nonatomic,copy) NSString *title;

-(instancetype)initSettingModelWithIndexPath:(NSIndexPath *)indexPath;
@end
