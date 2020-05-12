//
//  QuysAdSplashService.h
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved. 
//

#import "QuysIncentiveVideoAdviceDelegate.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
/// banner广告服务（外界调用）
@interface QuysIncentiveVideoAdvice : NSObject
@property (nonatomic,weak) id <QuysIncentiveVideoAdviceDelegate> delegate;//!<  服务代理
@property (nonatomic,strong) UIView *adviceView;//!<  广告视图


/// 创建弹窗广告
/// @param businessID 业务ID
/// @param bussinessKey 业务Key
/// @param delegate 回调代理
- (instancetype)initWithID:businessID
                       key:bussinessKey
             eventDelegate:(nonnull id<QuysIncentiveVideoAdviceDelegate>)delegate
     presentViewController:(UIViewController*)presentViewController;

/// 开始加载视图
- (void)loadAdView;



/// 开始展示视图
- (void)showAdView;


@end

NS_ASSUME_NONNULL_END
