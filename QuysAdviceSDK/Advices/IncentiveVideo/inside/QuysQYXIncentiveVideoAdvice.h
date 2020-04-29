//
//  QuysQYXIncentiveVideoAdvice.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysIncentiveVideoBaseAdvice.h"
#import "QuysIncentiveVideoAdviceDelegate.h"
#import <quysAdvice.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysQYXIncentiveVideoAdvice : QuysIncentiveVideoBaseAdvice

@property (nonatomic,weak) id <QuysIncentiveVideoAdviceDelegate> delegate;//!<  服务代理
@property (nonatomic,strong) UIView *adviceView;//!<  广告视图



/// 创建弹窗广告
/// @param businessID 业务ID
/// @param bussinessKey 业务Key
/// @param delegate 回调代理
/// @param parentView 弹窗父视图（展示弹窗的容器视图）
- (instancetype)initWithID:businessID
                       key:bussinessKey
             eventDelegate:(id <QuysIncentiveVideoAdviceDelegate>)delegate
                parentView:(UIView*)parentView;



@end

NS_ASSUME_NONNULL_END
