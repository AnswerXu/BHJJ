//
//  BHCommodityDetailViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/13.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHCommodityDetailViewController.h"
#import <WebKit/WebKit.h>

@interface BHCommodityDetailViewController ()<WKNavigationDelegate>

@end

@implementation BHCommodityDetailViewController

-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64)];
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"商品详情";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self loadRequest];
}
-(void)loadRequest{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_contentUrl]]];
}

@end
