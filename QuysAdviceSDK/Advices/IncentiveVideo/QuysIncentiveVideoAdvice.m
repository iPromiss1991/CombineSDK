//
//  QuysAdSplashService.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysIncentiveVideoAdvice.h"
#import "QuysQYXIncentiveVideoAdvice.h"
#import "QuysGDTIncentiveVideoAdvice.h"
@interface QuysIncentiveVideoAdvice()<QuysIncentiveVideoAdviceDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIViewController *presentViewController;

@property (nonatomic,strong) QuysIncentiveVideoBaseAdvice *advice;

@end


@implementation QuysIncentiveVideoAdvice

- (instancetype)initWithID:businessID
                       key:bussinessKey
             eventDelegate:(nonnull id<QuysIncentiveVideoAdviceDelegate>)delegate
     presentViewController:(UIViewController*)presentViewController
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.presentViewController = presentViewController;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //TODO:配置并请求数据
    QuysAdConfigManager *manager = [QuysAdConfigManager shareManager];
       QuysAdconfigResponseModelDataItemAdviceInfo* adviceInfo = [manager getAdviceByType:QuysConfigAdviceTypeBanner];
       if ([adviceInfo.channelName isEqualToString:k_qys_sdk])
       {
           QuysQYXIncentiveVideoAdvice *advice = [[QuysQYXIncentiveVideoAdvice alloc] initWithID:self.businessID key:self.bussinessKey  eventDelegate:self ];
           self.advice = advice;
       }else if ([adviceInfo.channelName isEqualToString:k_ks_sdk])
       {
           
       }else if ([adviceInfo.channelName isEqualToString:k_csj_sdk])
       {
           
       }else if ([adviceInfo.channelName isEqualToString:k_wm_sdk])
       {
           
       }else if ([adviceInfo.channelName isEqualToString:k_ylh_sdk])
       {
           QuysGDTIncentiveVideoAdvice *advice = [[QuysGDTIncentiveVideoAdvice alloc] initWithID:self.businessID key:self.bussinessKey  eventDelegate:self presentViewController:self.presentViewController];
           self.advice = advice;
       }else if ([adviceInfo.channelName isEqualToString:k_baidu_sdk])
       {
           
       }

    
}


/// 发起请求
- (void)loadAdViewAndShow
{
    [self.advice loadAdViewAndShow];
    
}

 

#pragma mark - QuysIncentiveVideoAdviceDelegate


/// @param advice 广告请求服务类
- (void)quys_requestStart:(QuysIncentiveVideoAdvice*) advice
{
     NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_requestStart:)])
    {
        [self.delegate quys_IncentiveVideoPlaystart:advice];
        
    }
}

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_requestSuccess:(QuysIncentiveVideoAdvice*) advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoRequestSuccess:)])
    {
        [self.delegate quys_IncentiveVideoRequestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param advice 广告请求服务类
- (void)quys_requestFial:(QuysIncentiveVideoAdvice*) advice error:(NSError*)error;
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoRequestFial:error:)])
    {
        
        [self.delegate quys_IncentiveVideoRequestFial:advice error:error ];
        
    }
}

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_interstitialOnExposure:(QuysIncentiveVideoAdvice*) advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnExposure:)])
    {
        
        [self.delegate quys_IncentiveVideoOnExposure:advice];
    }
}

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick advice:(QuysIncentiveVideoAdvice*) advice;
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnClickAdvice:)])
    {
        
        [self.delegate quys_IncentiveVideoOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_interstitialOnAdClose:(QuysIncentiveVideoAdvice*) advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnAdClose:)])
    {
        [self.delegate quys_IncentiveVideoOnAdClose:advice];
    }
}

/////
//
//- (void)quys_IncentiveVideoLoadFail:(nonnull NSError *)error advice:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoLoadFail:advice: )])
//       {
//           [self.delegate quys_IncentiveVideoLoadFail:error advice:advice];
//
//       }
//}
//
//- (void)quys_IncentiveVideoLoadSuccess:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoLoadSuccess:)])
//    {
//        [self.delegate quys_IncentiveVideoLoadSuccess:advice];
//    }
//}
/////
//- (void)quys_IncentiveVideoMuteplay:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoMuteplay:)])
//    {
//        [self.delegate quys_IncentiveVideoMuteplay:advice];
//    }
//}

- (void)quys_IncentiveVideoPlayEnd:(nonnull QuysIncentiveVideoAdvice *) advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayEnd:)])
    {
        [self.delegate quys_IncentiveVideoPlayEnd:advice];
    }
}

//- (void)quys_IncentiveVideoPlayProgress:(NSInteger)progress advice:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayProgress:advice:)])
//    {
//        [self.delegate quys_IncentiveVideoPlayProgress:progress advice:advice];
//    }
//}

- (void)quys_IncentiveVideoPlaystart:(nonnull QuysIncentiveVideoAdvice *) advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlaystart:)])
    {
        [self.delegate quys_IncentiveVideoPlaystart:advice];
    }
}

//- (void)quys_IncentiveVideoResume:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoResume:)])
//    {
//        [self.delegate quys_IncentiveVideoResume:advice];
//    }
//}
//
//- (void)quys_IncentiveVideoSkip:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoSkip:)])
//    {
//        [self.delegate quys_IncentiveVideoSkip:advice];
//    }
//}
//
//- (void)quys_IncentiveVideoSuspend:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoSuspend:)])
//    {
//        [self.delegate quys_IncentiveVideoSuspend:advice];
//    }
//}
//
//- (void)quys_IncentiveVideoUnMuteplay:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoUnMuteplay:)])
//    {
//        [self.delegate quys_IncentiveVideoUnMuteplay:advice];
//    }
//}
//
//- (void)quys_endViewInterstitialOnAdClose:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnAdClose:)])
//    {
//        [self.delegate quys_endViewInterstitialOnAdClose:advice];
//    }
//}
//
//- (void)quys_endViewInterstitialOnClick:(CGPoint)cpClick relativeClickPoint:(CGPoint)reClick advice:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnClick:relativeClickPoint:advice:)])
//    {
//        [self.delegate quys_endViewInterstitialOnClickAdvice:advice];
//    }
//}
//
//- (void)quys_endViewInterstitialOnExposure:(nonnull QuysIncentiveVideoAdvice *) advice
//{
//    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnExposure:)])
//    {
//        [self.delegate quys_endViewInterstitialOnExposure:advice];
//    }
//}


#pragma mark - Init
-(UIView *)adviceView
{
    if (_adviceView == nil)
    {
        _adviceView = [UIView new];
    }return _adviceView;
}


-(void)dealloc
{
    
}
@end
