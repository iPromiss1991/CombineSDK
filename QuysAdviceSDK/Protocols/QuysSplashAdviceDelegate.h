//
//  QuysAdSplashDelegate.h
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QuysSplashAdvice;
NS_ASSUME_NONNULL_BEGIN
///插屏广告协议
@protocol QuysSplashAdviceDelegate <NSObject>
@optional

/// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_SplashRequestStart:(QuysSplashAdvice*)advice;

/// 广告请求成功 
/// @param advice 广告请求服务类
- (void)quys_SplashRequestSuccess:(QuysSplashAdvice*)advice;

/// 广告请求失败
/// @param advice 广告请求服务类
/// @param error 失败信息
- (void)quys_SplashRequestFial:(QuysSplashAdvice*)advice error:(NSError*)error;

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_SplashOnExposure:(QuysSplashAdvice*)advice;

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_SplashOnClickAdvice:(QuysSplashAdvice*)advice;

/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_SplashOnAdClose:(QuysSplashAdvice*)advice;


@end
NS_ASSUME_NONNULL_END
