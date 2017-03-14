//
//  NetworkHelper.h
//  爱限免
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject
+ (id)shareInstance;
/**
 *  向服务器发送get请求
 *
 *  @param url     请求的接口
 *  @param parameter 向服务器请求数据时候的参数
 *  @param success 请求成功结果,block的参数为服务器返回的数据
 *  @param failure 请求失败,block的参数是错误的信息
 */
- (void)Get:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(id obj))success failure:(void (^)(NSError *error))failure;

/**
 *  向服务器post数据
 *
 *  @param url             要提交数据的结构
 *  @param parameter       要提交的数据
 *  @param success         成功执行的block，block的参数为服务器返回的内容
 *  @param failure         失败执行的block，block的参数为错误信息
 */
- (void)Post:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(id))success failure:(void (^)(NSError *))failure;

/**
 get请求
 
 @param url       服务器地址
 @param parameter 参数
 @param success   请求成功的回调
 @param failure   请求失败的回调
 @param isShow    是否展现SVProgressHUD视图
 */
- (void)Get:(NSString *)url parameter:(NSDictionary *)parameter success:(void (^)(id obj))success failure:(void (^)(NSError *error))failure isShowSVProgressHUD:(BOOL)isShow;
@end
