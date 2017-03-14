//
//  BHTopicListViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/13.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHTopicListViewController.h"

@interface BHTopicListViewController ()

@end

@implementation BHTopicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)refresh{}

-(void)requestDatas{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    [helper Get:[NSString stringWithFormat:kTopicAll,_ID] parameter:nil success:^(id obj) {
        NSDictionary *data = obj[@"data"];
        NSArray *posts = data[@"posts"];
        for(NSDictionary *dict in posts){
            BHHomeDataModel *model = [[BHHomeDataModel alloc] initWithDictionary:dict error:nil];
            [self.dataSource addObject:model];
        }
        [self.tableView reloadData];
    } failure:nil isShowSVProgressHUD:YES];
}
@end
