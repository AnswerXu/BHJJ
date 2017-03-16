//
//  BHProductDeltailViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/16.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHProductDeltailViewController.h"
#import <WebKit/WebKit.h>

@interface BHProductDeltailViewController ()

@end

@implementation BHProductDeltailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestHtmlString];
}

-(void)loadRequest{}

-(void)requestHtmlString{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    [helper Get:self.contentUrl parameter:nil success:^(id obj) {
        if ([obj[@"code"] integerValue] == 200) {
            [self.webView loadHTMLString:obj[@"data"][@"detail_html"] baseURL:[NSURL URLWithString:self.contentUrl]];
        }
    } failure:nil];
}
@end
