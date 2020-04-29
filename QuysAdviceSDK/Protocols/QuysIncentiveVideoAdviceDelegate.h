//
//  QuysIncentiveVideoDelegate.h
//  quysAdvice
//
//  Created by quys on 2019/12/30.
//  Copyright © 2019 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuysBaseAdviceDelegate.h"

NS_ASSUME_NONNULL_BEGIN
///激励视频广告协议（请遵循协议）
@protocol QuysIncentiveVideoAdviceDelegate <QuysBaseAdviceDelegate>
@optional

/// 广告加载成功
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoLoadSuccess:(QuysBaseAdvice*)advice;

/// 广告加载失败
/// @param error 广告加载失败错误
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoLoadFail:(NSError *)error advice:(QuysBaseAdvice*)advice;

/// 广告开始播放
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoPlaystart:(QuysBaseAdvice*)advice;

/// 广告播放结束
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoPlayEnd:(QuysBaseAdvice*)advice;

/// 跳过广告
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoSkip:(QuysBaseAdvice*)advice;

/// 广告静音
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoMuteplay:(QuysBaseAdvice*)advice;

/// 广告取消静音
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoUnMuteplay:(QuysBaseAdvice*)advice;

/// 广告暂停
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoSuspend:(QuysBaseAdvice*)advice;

/// 广告继续播放
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoResume:(QuysBaseAdvice*)advice;


/// 广告播放进度
/// @param progress 广告播放进度
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoPlayProgress:(NSInteger)progress advice:(QuysBaseAdvice*)advice;


//尾帧
/// 广告尾帧曝光
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_endViewInterstitialOnExposure:(QuysBaseAdvice*)advice;


/// 广告尾帧点击
/// @param cpClick 点击绝对坐标（相对于手机屏幕）
/// @param reClick 点击相对坐标（相对于广告视图）
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_endViewInterstitialOnClick:(CGPoint)cpClick relativeClickPoint:(CGPoint)reClick  advice:(QuysBaseAdvice*)advice;

/// 广告尾帧关闭
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_endViewInterstitialOnAdClose:(QuysBaseAdvice*)advice;

@end

NS_ASSUME_NONNULL_END
