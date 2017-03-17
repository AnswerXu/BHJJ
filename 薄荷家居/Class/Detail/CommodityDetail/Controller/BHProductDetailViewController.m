//
//  BHProductDeltailViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/16.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHProductDetailViewController.h"
#import <WebKit/WebKit.h>
#import "BHProductDetailHeaderView.h"
#import "BHProductDetailModel.h"
#import "BHProductDetailToolbar.h"

@interface BHProductDetailViewController ()<WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) BHProductDetailHeaderView *headerView;
@property (nonatomic,copy) BHProductDetailModel *detailModel;
@end

@implementation BHProductDetailViewController

-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64 - 49)];
        _webView.navigationDelegate = self;
    }
    return _webView;
}
-(BHProductDetailHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[BHProductDetailHeaderView alloc] init];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"商品详情";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self requestHtmlString];
    [self setupToolBar];
}

-(void)setupToolBar{
    
    BHProductDetailToolbar *toolBar = [[BHProductDetailToolbar alloc] initWithFrame:CGRectMake(0, self.view.height - 64 - 49, self.view.width, 49)];
    [self.view addSubview:toolBar];
}

-(void)requestHtmlString{
    NetworkHelper *helper = [NetworkHelper shareInstance];
    [helper Get:self.contentUrl parameter:nil success:^(id obj) {
        if ([obj[@"code"] integerValue] == 200) {
            _detailModel = [[BHProductDetailModel alloc] initWithDictionary:obj[@"data"] error:nil];
            [self.webView loadHTMLString:_detailModel.detail_html baseURL:[NSURL URLWithString:self.contentUrl]];
            self.headerView.imageUrls = _detailModel.image_urls;
            self.headerView.titleText = _detailModel.name;
            self.headerView.priceText = _detailModel.price;
            self.headerView.descriptionText = _detailModel.descript;
        }
    } failure:nil];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(self.headerView.height, 0, 0, 0);
    [self.webView.scrollView addSubview:self.headerView];
    self.webView.scrollView.contentOffset = CGPointMake(0, -self.headerView.height);
}


@end
