//
//  QuysBannerBaseAdvice.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/27.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysInformationFlowBaseAdvice : NSObject

/// 开始加载视图
- (void)loadAdViewNow;


/// 开始展示视图
- (UIView*)showAdView;

@end

NS_ASSUME_NONNULL_END
