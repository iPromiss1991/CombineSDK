//
//  QuysAdSplashService.h
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved. 
//

#import "QuysInformationFlowAdviceDelegate.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
/// banner广告服务（外界调用）
@interface QuysInformationFlowAdvice : NSObject
@property (nonatomic,weak) id <QuysInformationFlowAdviceDelegate> delegate;//!<  服务代理
@property (nonatomic,strong) UIView *adviceView;//!<  广告视图



/// 创建弹窗广告
/// @param businessID 业务ID
/// @param bussinessKey 业务Key
/// @param frame 弹窗frame
/// @param delegate 回调代理
/// @param parentView 弹窗父视图（展示弹窗的容器视图）
/// @param currentViewController 弹窗父视图VC
- (instancetype)initWithID:businessID
                       key:bussinessKey
                    cgRect:(CGRect)frame
             eventDelegate:(id <QuysInformationFlowAdviceDelegate>)delegate
                parentView:(UIView*)parentView
viewController:(UIViewController*)currentViewController;

/// 开始加载视图
- (void)loadAdViewNow;


/// 开始展示视图
- (UIView*)showAdView;
@end

NS_ASSUME_NONNULL_END
