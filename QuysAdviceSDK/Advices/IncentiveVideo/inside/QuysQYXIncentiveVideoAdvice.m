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

- (instancetype)initWithID:businessID key:bussinessKey   eventDelegate:(nonnull id<QuysOpenScreenAdviceDelegate>)delegate parentView:(nonnull UIView *)parentView
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
        [self.delegate quys_interstitialOnClick:cpClick relativeClickPoint:cpClick service:advice];
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
