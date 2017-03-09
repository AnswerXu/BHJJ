//
//  BHHomeBaseViewController.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BHHomeDataModel;
@interface BHHomeBaseViewController : UIViewController
@property (nonatomic,copy) NSMutableArray<BHHomeDataModel *> *dataSource;
@end
