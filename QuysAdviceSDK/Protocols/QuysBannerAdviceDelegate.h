//
//  QuysAdSplashDelegate.h
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QuysBannerAdvice;

NS_ASSUME_NONNULL_BEGIN
///插屏广告协议
@protocol QuysBannerAdviceDelegate <NSObject>
@optional

/// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_BannerRequestStart:(QuysBannerAdvice*)advice;

/// 广告请求成功（eg：建议在该方法中或者之后再   展示广告）
/// @param advice 广告请求服务类
- (void)quys_BannerRequestSuccess:(QuysBannerAdvice*)advice;

/// 广告请求失败
/// @param advice 广告请求服务类
/// @param error 失败信息
- (void)quys_BannerRequestFial:(QuysBannerAdvice*)advice error:(NSError*)error;

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_BannerOnExposure:(QuysBannerAdvice*)advice;

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_BannerOnClickAdvice:(QuysBannerAdvice*)advice;

/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_BannerOnAdClose:(QuysBannerAdvice*)advice;


@end
NS_ASSUME_NONNULL_END
