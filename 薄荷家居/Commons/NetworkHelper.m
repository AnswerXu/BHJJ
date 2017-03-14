//
//  NetworkHelper.m
//  爱限免
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NetworkHelper.h"
#import "AFNetworking.h"
@implementation NetworkHelper
//获取网络请求单例
+ (id)shareInstance {
    static NetworkHelper *helper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(helper == nil){
            helper = [[self alloc] init];
        }
    });
    return helper;
}

- (void)Get:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(id obj))success failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",nil];
    [manager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error && failure) {
            failure(error);
        }
    }];
}

- (void)Post:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",nil];
    [manager POST:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error && failure) {
            failure(error);
        }
    }];
}

- (void)Get:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(id obj))success failure:(void (^)(NSError *error))failure isShowSVProgressHUD:(BOOL)isShow{
    if (isShow) [SVProgressHUD show];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"application/json",nil];
    [manager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (isShow) [SVProgressHUD dismiss];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (isShow) [SVProgressHUD dismiss];
        if (error && failure) {
            failure(error);
        }
    }];
}

@end
