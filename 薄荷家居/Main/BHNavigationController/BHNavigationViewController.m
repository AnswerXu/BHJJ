//
//  BHNavigationViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHNavigationViewController.h"

@interface BHNavigationViewController ()

@end

@implementation BHNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:[[NSMutableDictionary alloc] initWithDictionary:@{NSForegroundColorAttributeName : [UIColor whiteColor] , NSFontAttributeName : [UIFont systemFontOfSize:17]}]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

@end
