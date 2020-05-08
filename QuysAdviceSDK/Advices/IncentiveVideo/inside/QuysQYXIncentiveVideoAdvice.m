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
 
@property (nonatomic,strong) QuysIncentiveVideoService *service;

@end


@implementation QuysQYXIncentiveVideoAdvice

- (instancetype)initWithID:businessID key:bussinessKey   eventDelegate:(nonnull id<QuysIncentiveVideoAdviceDelegate>)delegate
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
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




#pragma mark - quys_IncentiveVide

/// 开始发起广告请求
/// @param service 广告请求服务类
- (void)quys_requestStart:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoRequestStart:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoRequestStart:advice];
        
    }
}

/// 广告请求成功
/// @param service 广告请求服务类
- (void)quys_requestSuccess:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoRequestSuccess:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        QuysAdBannerService *serviceItem = (QuysAdBannerService*)service;
        advice.adviceView = serviceItem.adviceView;
        [self.delegate quys_IncentiveVideoRequestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param service 广告请求服务类
- (void)quys_requestFial:(QuysAdBaseService*)service error:(NSError*)error;
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoRequestFial:error:)])
       {
           QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
           [self.delegate quys_IncentiveVideoRequestFial:advice error:error];
           
       }
}

/// 广告曝光
/// @param service 广告请求服务类
- (void)quys_interstitialOnExposure:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnExposure:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoOnExposure:advice];
    }
}

/// 广告点击
/// @param service 广告请求服务类
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick service:(QuysAdBaseService*)service;
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnClickAdvice:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param service 广告请求服务类
- (void)quys_interstitialOnAdClose:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnAdClose:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoOnAdClose:advice];
    }
}




//
//- (void)quys_IncentiveVideoLoadFail:(nonnull NSError *)error service:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoLoadFail:service: )])
//       {
//           QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//           [self.delegate quys_IncentiveVideoLoadFail:error advice:advice];
//
//       }
//}
//
//- (void)quys_IncentiveVideoLoadSuccess:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoLoadSuccess:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_IncentiveVideoLoadSuccess:advice];
//    }
//}
/////
//- (void)quys_IncentiveVideoMuteplay:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoMuteplay:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_IncentiveVideoMuteplay:advice];
//    }
//}

- (void)quys_IncentiveVideoPlayEnd:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayEnd:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoPlayEnd:advice];
    }
}

//- (void)quys_IncentiveVideoPlayProgress:(NSInteger)progress service:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayProgress:service:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_IncentiveVideoPlayProgress:progress advice:advice];
//    }
//}

- (void)quys_IncentiveVideoPlaystart:(nonnull QuysAdBaseService *)service
{
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlaystart:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_IncentiveVideoPlaystart:advice];
    }
}

//- (void)quys_IncentiveVideoResume:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoResume:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_IncentiveVideoResume:advice];
//    }
//}
//
//- (void)quys_IncentiveVideoSkip:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoSkip:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_IncentiveVideoSkip:advice];
//    }
//}
//
//- (void)quys_IncentiveVideoSuspend:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoSuspend:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_IncentiveVideoSuspend:advice];
//    }
//}
//
//- (void)quys_IncentiveVideoUnMuteplay:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoUnMuteplay:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_IncentiveVideoUnMuteplay:advice];
//    }
//}
//
//- (void)quys_endViewInterstitialOnAdClose:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnAdClose:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_endViewInterstitialOnAdClose:advice];
//    }
//}
//
//- (void)quys_endViewInterstitialOnClick:(CGPoint)cpClick relativeClickPoint:(CGPoint)reClick service:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnClick:relativeClickPoint:service:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_endViewInterstitialOnClickAdvice:advice];
//    }
//}
//
//- (void)quys_endViewInterstitialOnExposure:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_endViewInterstitialOnExposure:)])
//    {
//        QuysIncentiveVideoAdvice *advice = [self buildAdvice:service];
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
