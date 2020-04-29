//
//  QuysAdviceBaseDelegate.h
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QuysBaseAdvice.h"
 
NS_ASSUME_NONNULL_BEGIN
///广告基础协议（请遵循协议）
@protocol QuysBaseAdviceDelegate <NSObject>

@optional

/// 开始发起广告请求
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestStart:(QuysBaseAdvice*)advice;

/// 广告请求成功
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestSuccess:(QuysBaseAdvice*)advice;

/// 广告请求失败
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestFial:(QuysBaseAdvice*)advice error:(NSError*)error;

/// 广告曝光
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnExposure:(QuysBaseAdvice*)advice;

/// 广告点击
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick advice:(QuysBaseAdvice*)advice;

/// 广告关闭
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnAdClose:(QuysBaseAdvice*)advice;




@end

NS_ASSUME_NONNULL_END
