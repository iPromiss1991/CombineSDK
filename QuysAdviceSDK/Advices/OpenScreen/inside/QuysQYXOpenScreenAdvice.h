//
//  QuysQYXOpenScreenAdvice.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysOpenScreenBaseAdvice.h"
#import "QuysOpenScreenAdviceDelegate.h"
#import <quysAdvice.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysQYXOpenScreenAdvice : QuysOpenScreenBaseAdvice

@property (nonatomic,weak) id <QuysOpenScreenAdviceDelegate> delegate;//!<  服务代理
@property (nonatomic,strong) UIWindow *adviceView;//!<  广告




/// 创建弹窗广告
/// @param businessID 业务ID
/// @param bussinessKey 业务Key
/// @param launchScreenVC 弹窗背景视图（在广告请求期间的占位图：必须）
/// @param delegate 回调代理
- (instancetype)initWithID:businessID
                       key:bussinessKey
              launchScreenVC:(UIViewController*)launchScreenVC
             eventDelegate:(nonnull id<QuysOpenScreenAdviceDelegate>)delegate;


@end

NS_ASSUME_NONNULL_END
