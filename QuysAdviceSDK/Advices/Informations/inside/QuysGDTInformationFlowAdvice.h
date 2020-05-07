//
//  QuysQYXInformationFlowAdvice.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysInformationFlowBaseAdvice.h"
#import "QuysSplashAdviceDelegate.h"
#import <quysAdvice.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysGDTInformationFlowAdvice : QuysInformationFlowBaseAdvice

@property (nonatomic,weak) id <QuysSplashAdviceDelegate> delegate;//!<  服务代理
@property (nonatomic,strong,nullable) UIView *adviceView;//!<  广告视图



/// 创建弹窗广告
/// @param businessID 业务ID
/// @param bussinessKey 业务Key
/// @param frame 弹窗frame
/// @param delegate 回调代理
/// @param parentView 弹窗父视图（展示弹窗的容器视图）
- (instancetype)initWithID:businessID
                       key:bussinessKey
                    cgRect:(CGRect)frame
             eventDelegate:(id <QuysSplashAdviceDelegate>)delegate
                parentView:(UIView*)parentView;

@property (nonatomic,strong) UIViewController *currentViewController;


@end

NS_ASSUME_NONNULL_END
