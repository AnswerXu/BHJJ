//
//  BHHomeBaseViewController.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/8.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHHomeDataModel.h"

@interface BHHomeBaseViewController : UIViewController
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSMutableArray<BHHomeDataModel *> *dataSource;
@property (nonatomic,assign) BOOL isDown;
@property (nonatomic,assign) NSInteger offset;
-(void)requestDatas;
@end
