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

 

#pragma mark - QuysAdSplashDelegate

// 开始发起广告请求
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestStart:(QuysBaseAdvice*) advice
{
     NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_requestStart:)])
    {
        [self.delegate quys_requestStart:advice];
        
    }
}

/// 广告请求成功
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestSuccess:(QuysBaseAdvice*) advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_requestSuccess:)])
    {
        [self.delegate quys_requestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestFial:(QuysBaseAdvice*) advice error:(NSError*)error;
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_requestFial:error:)])
    {
        
        [self.delegate quys_requestFial:advice error:error];
        
    }
}

/// 广告曝光
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnExposure:(QuysBaseAdvice*) advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnExposure:)])
    {
        
        [self.delegate quys_interstitialOnExposure:advice];
    }
}

/// 广告点击
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick advice:(QuysBaseAdvice*) advice;
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnClickAdvice:)])
    {
        
        [self.delegate quys_interstitialOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnAdClose:(QuysBaseAdvice*) advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnAdClose:)])
    {
        [self.delegate quys_interstitialOnAdClose:advice];
    }
}

///

- (void)quys_IncentiveVideoLoadFail:(nonnull NSError *)error advice:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoLoadFail:advice: )])
       {
           [self.delegate quys_IncentiveVideoLoadFail:error advice:advice];
           
       }
}

- (void)quys_IncentiveVideoLoadSuccess:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoLoadSuccess:)])
    {
        [self.delegate quys_IncentiveVideoLoadSuccess:advice];
    }
}
///
- (void)quys_IncentiveVideoMuteplay:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoMuteplay:)])
    {
        [self.delegate quys_IncentiveVideoMuteplay:advice];
    }
}

- (void)quys_IncentiveVideoPlayEnd:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayEnd:)])
    {
        [self.delegate quys_IncentiveVideoPlayEnd:advice];
    }
}

- (void)quys_IncentiveVideoPlayProgress:(NSInteger)progress advice:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayProgress:advice:)])
    {
        [self.delegate quys_IncentiveVideoPlayProgress:progress advice:advice];
    }
}

- (void)quys_IncentiveVideoPlaystart:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlaystart:)])
    {
        [self.delegate quys_IncentiveVideoPlaystart:advice];
    }
}

- (void)quys_IncentiveVideoResume:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoResume:)])
    {
        [self.delegate quys_IncentiveVideoResume:advice];
    }
}

- (void)quys_IncentiveVideoSkip:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoSkip:)])
    {
        [self.delegate quys_IncentiveVideoSkip:advice];
    }
}

- (void)quys_IncentiveVideoSuspend:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoSuspend:)])
    {
        [self.delegate quys_IncentiveVideoSuspend:advice];
    }
}

- (void)quys_IncentiveVideoUnMuteplay:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoUnMuteplay:)])
    {
        [self.delegate quys_IncentiveVideoUnMuteplay:advice];
    }
}

- (void)quys_endViewInterstitialOnAdClose:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnAdClose:)])
    {
        [self.delegate quys_endViewInterstitialOnAdClose:advice];
    }
}

- (void)quys_endViewInterstitialOnClick:(CGPoint)cpClick relativeClickPoint:(CGPoint)reClick advice:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnClick:relativeClickPoint:advice:)])
    {
        [self.delegate quys_endViewInterstitialOnClickAdvice:advice];
    }
}

- (void)quys_endViewInterstitialOnExposure:(nonnull QuysBaseAdvice *) advice
{
    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnExposure:)])
    {
        [self.delegate quys_endViewInterstitialOnExposure:advice];
    }
}


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
