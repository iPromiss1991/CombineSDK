//
//  QuysQYXSplashAdvice.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysSplashBaseAdvice.h"
#import "QuysSplashAdviceDelegate.h"
#import <quysAdvice.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysQYXSplashAdvice : QuysSplashBaseAdvice

@property (nonatomic,weak) id <QuysSplashAdviceDelegate> delegate;//!<  服务代理
@property (nonatomic,strong) UIView *adviceView;//!<  广告视图



/// 创建弹窗广告
/// @param businessID 业务ID
/// @param bussinessKey 业务Key
/// @param delegate 回调代理
/// @param parentViewController 弹窗父视图（展示弹窗的容器视图）
- (instancetype)initWithID:businessID
                       key:bussinessKey
             eventDelegate:(id <QuysSplashAdviceDelegate>)delegate
                parentViewController:(UIViewController*)parentViewController;



@end

NS_ASSUME_NONNULL_END
