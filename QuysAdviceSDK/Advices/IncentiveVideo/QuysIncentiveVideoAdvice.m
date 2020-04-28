//
//  QuysAdSplashService.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysIncentiveVideoAdvice.h"
#import "QuysQYXIncentiveVideoAdvice.h"

@interface QuysIncentiveVideoAdvice()<QuysIncentiveVideoAdviceDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIView *parentView;

@property (nonatomic,strong) QuysIncentiveVideoBaseAdvice *advice;

@end


@implementation QuysIncentiveVideoAdvice

- (instancetype)initWithID:businessID
                       key:bussinessKey
             eventDelegate:(nonnull id<QuysIncentiveVideoAdviceDelegate>)delegate
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
    //TODO:配置并请求数据
    
    QuysQYXIncentiveVideoAdvice *service = [[QuysQYXIncentiveVideoAdvice alloc] initWithID:self.businessID key:self.bussinessKey  eventDelegate:self parentView:self.parentView];
    self.advice = service;
    
}


/// 发起请求
- (void)loadAdViewAndShow
{
    [self.advice loadAdViewAndShow];
    
}

 

#pragma mark - QuysAdSplashDelegate

// 开始发起广告请求
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestStart:(QuysBaseAdvice*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_requestStart:)])
    {
        [self.delegate quys_requestStart:service];
        
    }
}

/// 广告请求成功
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestSuccess:(QuysBaseAdvice*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_requestSuccess:)])
    {
        [self.delegate quys_requestSuccess:service];
        
    }
}


/// 广告请求失败
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestFial:(QuysBaseAdvice*)service error:(NSError*)error;
{
    if ([self.delegate respondsToSelector:@selector(quys_requestFial:error:)])
    {
        
        [self.delegate quys_requestFial:service error:error];
        
    }
}

/// 广告曝光
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnExposure:(QuysBaseAdvice*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnExposure:)])
    {
        
        [self.delegate quys_interstitialOnExposure:service];
    }
}

/// 广告点击
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick service:(QuysBaseAdvice*)service;
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnClick:relativeClickPoint:service:)])
    {
        
        [self.delegate quys_interstitialOnClick:cpClick relativeClickPoint:cpClick service:service];
    }
}
/// 广告关闭
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnAdClose:(QuysBaseAdvice*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnAdClose:)])
    {
        [self.delegate quys_interstitialOnAdClose:service];
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
