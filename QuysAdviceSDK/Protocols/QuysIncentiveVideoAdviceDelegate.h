//
//  QuysIncentiveVideoDelegate.h
//  quysAdvice
//
//  Created by quys on 2019/12/30.
//  Copyright © 2019 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QuysIncentiveVideoAdvice;

NS_ASSUME_NONNULL_BEGIN
///激励视频广告协议 
@protocol QuysIncentiveVideoAdviceDelegate<NSObject>
@optional

@optional

/// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoRequestStart:(QuysIncentiveVideoAdvice*)advice;

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoRequestSuccess:(QuysIncentiveVideoAdvice*)advice;

/// 广告请求失败
/// @param advice 广告请求服务类
/// @param error 失败信息
- (void)quys_IncentiveVideoRequestFial:(QuysIncentiveVideoAdvice*)advice error:(NSError*)error;

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoOnExposure:(QuysIncentiveVideoAdvice*)advice;

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoOnClickAdvice:(QuysIncentiveVideoAdvice*)advice;

/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoOnAdClose:(QuysIncentiveVideoAdvice*)advice;

/// 广告开始播放
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoPlaystart:(QuysIncentiveVideoAdvice*)advice;

/// 广告播放结束
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoPlayEnd:(QuysIncentiveVideoAdvice*)advice;

    

@end

NS_ASSUME_NONNULL_END
