//
//  QuysDemoViewController.h
//  quysDevDemo
//
//  Created by quys on 2020/1/7.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuysAdviceSDK/QuysAdviceSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysDemoViewController : UIViewController<QuysSplashAdviceDelegate,QuysIncentiveVideoAdviceDelegate,QuysIncentiveVideoAdviceDelegate,QuysInformationFlowAdviceDelegate,QuysBannerAdviceDelegate>

@end

NS_ASSUME_NONNULL_END
