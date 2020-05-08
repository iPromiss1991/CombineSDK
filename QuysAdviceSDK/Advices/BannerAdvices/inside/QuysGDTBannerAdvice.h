//
//  QuysGDTBannerBaseAdvice.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/5/6.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysBannerBaseAdvice.h"
#import "GDTUnifiedBannerView.h"
#import "QuysBannerAdviceDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface QuysGDTBannerAdvice : QuysBannerBaseAdvice

@property (nonatomic,weak) id <QuysBannerAdviceDelegate> delegate;//!<  服务代理
@property (nonatomic,strong) GDTUnifiedBannerView *adviceView;//!<  广告视图



/// 创建弹窗广告
/// @param businessID 业务ID
/// @param bussinessKey 业务Key
/// @param frame 弹窗frame
/// @param delegate 回调代理
/// @param parentVC 弹窗父视图（展示弹窗的容器视图）
- (instancetype)initWithID:businessID
                       key:bussinessKey
                    cgRect:(CGRect)frame
             eventDelegate:(id <QuysBannerAdviceDelegate>)delegate
                parentViewController:(UIViewController*)parentVC;

@end

NS_ASSUME_NONNULL_END
