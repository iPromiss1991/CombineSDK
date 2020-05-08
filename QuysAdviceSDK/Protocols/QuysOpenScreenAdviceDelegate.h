
//
//  QuysAdviceOpeenScreenDelegate.h
//  quysAdvice
//
//  Created by quys on 2019/12/31.
//  Copyright © 2019 Quys. All rights reserved.
//


#import <Foundation/Foundation.h>
@class QuysOpenScreenAdvice;
NS_ASSUME_NONNULL_BEGIN

/// 开屏广告代理（请遵循协议）
@protocol QuysOpenScreenAdviceDelegate <NSObject>
@optional

/// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_OpenScreenRequestStart:(QuysOpenScreenAdvice*)advice;

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_OpenScreenRequestSuccess:(QuysOpenScreenAdvice*)advice;

/// 广告请求失败
/// @param advice 广告请求服务类
/// @param error 失败信息
- (void)quys_OpenScreenRequestFial:(QuysOpenScreenAdvice*)advice error:(NSError*)error;

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_OpenScreenOnExposure:(QuysOpenScreenAdvice*)advice;

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_OpenScreenOnClickAdvice:(QuysOpenScreenAdvice*)advice;

/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_OpenScreenOnAdClose:(QuysOpenScreenAdvice*)advice;


@end

NS_ASSUME_NONNULL_END
