//
//  QuysAdSplashDelegate.h
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QuysInformationFlowAdvice;
NS_ASSUME_NONNULL_BEGIN
///插屏广告协议
@protocol QuysInformationFlowAdviceDelegate <NSObject>
@optional

/// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_InformationFlowRequestStart:(QuysInformationFlowAdvice*)advice;

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_InformationFlowRequestSuccess:(QuysInformationFlowAdvice*)advice;

/// 广告请求失败
/// @param advice 广告请求服务类
/// @param error 失败信息
- (void)quys_InformationFlowRequestFial:(QuysInformationFlowAdvice*)advice error:(NSError*)error;

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_InformationFlowOnExposure:(QuysInformationFlowAdvice*)advice;

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_InformationFlowOnClickAdvice:(QuysInformationFlowAdvice*)advice;

/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_InformationFlowOnAdClose:(QuysInformationFlowAdvice*)advice;


@end
NS_ASSUME_NONNULL_END
