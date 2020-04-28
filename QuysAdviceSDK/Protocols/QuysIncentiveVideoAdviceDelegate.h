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

/// 广告加载成功
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoLoadSuccess:(QuysBaseAdvice*)service;

/// 广告加载失败
/// @param error 广告加载失败错误
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoLoadFail:(NSError *)error service:(QuysBaseAdvice*)service;

/// 广告开始播放
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoPlaystart:(QuysBaseAdvice*)service;

/// 广告播放结束
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoPlayEnd:(QuysBaseAdvice*)service;

/// 跳过广告
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoSkip:(QuysBaseAdvice*)service;

/// 广告静音
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoMuteplay:(QuysBaseAdvice*)service;

/// 广告取消静音
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoUnMuteplay:(QuysBaseAdvice*)service;

/// 广告暂停
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoSuspend:(QuysBaseAdvice*)service;

/// 广告继续播放
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoResume:(QuysBaseAdvice*)service;


/// 广告播放进度
/// @param progress 广告播放进度
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_IncentiveVideoPlayProgress:(NSInteger)progress service:(QuysBaseAdvice*)service;


//尾帧
/// 广告尾帧曝光
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_endViewInterstitialOnExposure:(QuysBaseAdvice*)service;


/// 广告尾帧点击
/// @param cpClick 点击绝对坐标（相对于手机屏幕）
/// @param reClick 点击相对坐标（相对于广告视图）
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_endViewInterstitialOnClick:(CGPoint)cpClick relativeClickPoint:(CGPoint)reClick  service:(QuysBaseAdvice*)service;

/// 广告尾帧关闭
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_endViewInterstitialOnAdClose:(QuysBaseAdvice*)service;

@end

NS_ASSUME_NONNULL_END
