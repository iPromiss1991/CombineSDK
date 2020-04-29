//
//  QuysQYXIncentiveVideoAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysQYXIncentiveVideoAdvice.h"
#import "QuysIncentiveVideoAdvice.h"
@interface QuysQYXIncentiveVideoAdvice()<QuysIncentiveVideoDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
 
@property (nonatomic,strong) UIView *parentView;

 
@property (nonatomic,strong) QuysIncentiveVideoService *service;

@end


@implementation QuysQYXIncentiveVideoAdvice

- (instancetype)initWithID:businessID key:bussinessKey   eventDelegate:(nonnull id<QuysIncentiveVideoAdviceDelegate>)delegate parentView:(nonnull UIView *)parentView
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.parentView = parentView;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据

    QuysIncentiveVideoService *service = [[QuysIncentiveVideoService alloc] initWithID:self.businessID key:self.bussinessKey   eventDelegate:self];
    self.service = service;
    
}

- (void)loadAdViewAndShow
{
    [self.service loadAdViewAndShow];
    
}


#pragma mark - Method

- (QuysIncentiveVideoAdvice*)buildAdvice:(QuysAdBaseService*)service
{
    QuysIncentiveVideoAdvice *advice = (QuysIncentiveVideoAdvice*)self.delegate;
    return advice;
}




#pragma mark - QuysAdSplashDelegate

/// 开始发起广告请求
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestStart:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_requestStart:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_requestStart:advice];
        
    }
}

/// 广告请求成功
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestSuccess:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_requestSuccess:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        QuysAdBannerService *serviceItem = (QuysAdBannerService*)service;
        advice.adviceView = serviceItem.adviceView;
        [self.delegate quys_requestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestFial:(QuysAdBaseService*)service error:(NSError*)error;
{
    if ([self.delegate respondsToSelector:@selector(quys_requestFial:error:)])
       {
           QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
           [self.delegate quys_requestFial:advice error:error];
           
       }
}

/// 广告曝光
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnExposure:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnExposure:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_interstitialOnExposure:advice];
    }
}

/// 广告点击
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick service:(QuysAdBaseService*)service;
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnClick:relativeClickPoint:service:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_interstitialOnClick:cpClick relativeClickPoint:cpClick advice:advice];
    }
}
/// 广告关闭
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnAdClose:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnAdClose:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_interstitialOnAdClose:advice];
    }
}





- (void)quys_IncentiveVideoLoadFail:(nonnull NSError *)error service:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoLoadFail:service: )])
       {
           QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
           [self.delegate quys_IncentiveVideoLoadFail:error advice:advice];
           
       }
}

- (void)quys_IncentiveVideoLoadSuccess:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoLoadSuccess:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoLoadSuccess:advice];
    }
}
///
- (void)quys_IncentiveVideoMuteplay:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoMuteplay:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoMuteplay:advice];
    }
}

- (void)quys_IncentiveVideoPlayEnd:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayEnd:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoPlayEnd:advice];
    }
}

- (void)quys_IncentiveVideoPlayProgress:(NSInteger)progress service:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayProgress:service:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoPlayProgress:progress advice:advice];
    }
}

- (void)quys_IncentiveVideoPlaystart:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlaystart:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoPlaystart:advice];
    }
}

- (void)quys_IncentiveVideoResume:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoResume:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoResume:advice];
    }
}

- (void)quys_IncentiveVideoSkip:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoSkip:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoSkip:advice];
    }
}

- (void)quys_IncentiveVideoSuspend:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoSuspend:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoSuspend:advice];
    }
}

- (void)quys_IncentiveVideoUnMuteplay:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoUnMuteplay:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoUnMuteplay:advice];
    }
}

- (void)quys_endViewInterstitialOnAdClose:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnAdClose:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_endViewInterstitialOnAdClose:advice];
    }
}

- (void)quys_endViewInterstitialOnClick:(CGPoint)cpClick relativeClickPoint:(CGPoint)reClick service:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnClick:relativeClickPoint:service:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_endViewInterstitialOnClick:cpClick relativeClickPoint:reClick advice:advice];
    }
}

- (void)quys_endViewInterstitialOnExposure:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnExposure:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
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
