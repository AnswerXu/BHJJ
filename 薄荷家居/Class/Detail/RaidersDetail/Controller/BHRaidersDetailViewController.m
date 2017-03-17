//
//  BHDetailViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/13.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHRaidersDetailViewController.h"
#import <WebKit/WebKit.h>
#import "BHCommodityDetailViewController.h"

@interface BHRaidersDetailViewController ()<WKNavigationDelegate,UIScrollViewDelegate>
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIImageView *headerView;
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,assign) CGFloat headerImageHeight;
@property (nonatomic,assign) CGPoint headerViewCenter;

@end

@implementation BHRaidersDetailViewController

-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
        _webView.scrollView.delegate = self;
        _webView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _webView;
}
-(UIImageView *)headerView{
    if (!_headerView) {
        _headerView = [[UIImageView  alloc] init];
        _headerView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headerView;
}
-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.font = [UIFont italicSystemFontOfSize:24];
        _textLabel.numberOfLines = 2;
        [self.headerView addSubview:_textLabel];
    }
    return _textLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"攻略详情";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_contentUrl]]];
    [self.view addSubview:self.webView];
}

-(void)setHeaderImageUrl:(NSString *)headerImageUrl{
    _headerImageUrl = headerImageUrl;
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:headerImageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            _headerImageHeight = 329.f/720 * self.view.width;
            self.headerView.frame = CGRectMake(0, -_headerImageHeight, self.view.width, _headerImageHeight);
            _headerViewCenter = self.headerView.center;
            self.webView.scrollView.contentInset = UIEdgeInsetsMake(_headerImageHeight, 0, 0, 0);
            [self.webView.scrollView addSubview:self.headerView];
            [self.webView.scrollView sendSubviewToBack:self.headerView];
        }
    }];
}

-(void)setTitleLabelText:(NSString *)titleLabelText{
    _titleLabelText = titleLabelText;
    self.textLabel.text = titleLabelText;
    CGSize textLabelSize = [self.textLabel sizeThatFits:CGSizeMake(self.headerView.width - 30, MAXFLOAT)];
    self.textLabel.frame = CGRectMake(15, self.headerView.height - textLabelSize.height - 20, textLabelSize.width, textLabelSize.height);
}

#pragma mark-  WKNavigationDelegate
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [SVProgressHUD show];
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [SVProgressHUD dismiss];
}
-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [SVProgressHUD dismiss];
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSString *urlString = [navigationAction.request.URL absoluteString];
    NSArray *urlComps = [urlString componentsSeparatedByString:@"?"];
    if ([urlComps count] && [urlComps.firstObject isEqualToString:@"http://s.click.taobao.com/t"]) {
        BHCommodityDetailViewController *commodityDetail = [[BHCommodityDetailViewController alloc] init];
        commodityDetail.contentUrl = urlString;
        [self.navigationController pushViewController:commodityDetail animated:YES];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y + _headerImageHeight;
    if (offset < 0 && offset > -100) {
        self.headerView.bounds = CGRectMake(0, 0, self.view.width + fabs(offset) * 329.f/720, _headerImageHeight + fabs(offset));
        self.headerView.center = CGPointMake(_headerViewCenter.x, _headerViewCenter.y - fabs(offset)/2);
        self.textLabel.maxY = self.headerView.height - 20;
        self.textLabel.x = (self.headerView.width - self.textLabel.width)/2;
    }
}

@end
