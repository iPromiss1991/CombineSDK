
//
//  QuysAdviceOpeenScreenDelegate.h
//  quysAdvice
//
//  Created by quys on 2019/12/31.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysBaseAdviceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/// 开屏广告代理（请遵循协议）
@protocol QuysOpenScreenAdviceDelegate <QuysBaseAdviceDelegate>
@optional


/// 视频播放开始
/// @param advice 广告服务对象
- (void)quys_videoPlaystart:(QuysBaseAdvice*)advice;


/// 视频播放结束
/// @param advice 广告服务对象
- (void)quys_videoPlayEnd:(QuysBaseAdvice*)advice;
@end

NS_ASSUME_NONNULL_END
