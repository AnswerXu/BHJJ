//
//  BHCommodityDetailViewController.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/13.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WKWebView;
@interface BHCommodityDetailViewController : UIViewController
@property (nonatomic,copy) NSString *contentUrl;
@property (nonatomic,strong) WKWebView *webView;
@end
