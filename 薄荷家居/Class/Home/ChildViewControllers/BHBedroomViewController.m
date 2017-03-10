//
//  BHBedroomViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHBedroomViewController.h"

@interface BHBedroomViewController ()

@end

@implementation BHBedroomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)requestDatas{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    NSDictionary *paramers = @{kOffset:@(self.offset),kLimit:@(20)};
    [helper Get:kBedroom parameter:paramers success:^(id obj) {
        if (self.isDown) {
            [self.dataSource removeAllObjects];
        }
        NSArray *items = obj[@"data"][@"items"];
        for (NSDictionary *dict in items) {
            BHHomeDataModel *model = [[BHHomeDataModel alloc] initWithDictionary:dict error:nil];
            [self.dataSource addObject:model];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:nil];
}


@end
