//
//  QuysQYXSplashAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysQYXSplashAdvice.h"
#import "QuysSplashAdvice.h"
@interface QuysQYXSplashAdvice()<QuysAdSplashDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIView *parentView;

 
@property (nonatomic,strong) QuysAdSplashService *service;

@end


@implementation QuysQYXSplashAdvice

- (instancetype)initWithID:businessID key:bussinessKey cgRect:(CGRect)cgFrame eventDelegate:(nonnull id<QuysSplashAdviceDelegate>)delegate parentView:(nonnull UIView *)parentView
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.parentView = parentView;
        self.cgFrame = cgFrame;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据

    QuysAdSplashService *service = [[QuysAdSplashService alloc] initWithID:self.businessID key:self.bussinessKey cgRect:self.cgFrame eventDelegate:self parentView:self.parentView];
    self.service = service;
    
}


/// 发起请求
- (void)loadAdViewNow
{
    [self.service loadAdViewNow];
    
}


/// 开始展示视图
- (void)showAdView
{

     [self.service showAdView];
}
 
#pragma mark - Method

- (QuysSplashAdvice*)buildAdvice:(QuysAdBaseService*)service
{
    QuysSplashAdvice *advice = (QuysSplashAdvice*)self.delegate;
    return advice;
}




#pragma mark - QuysAdSplashDelegate

/// 开始发起广告请求
/// @param service 广告请求服务类
- (void)quys_requestStart:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashRequestStart:)])
    {
        QuysSplashAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_SplashRequestStart:advice];
        
    }
}

/// 广告请求成功
/// @param service 广告请求服务类
- (void)quys_requestSuccess:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashRequestSuccess:)])
    {
        QuysSplashAdvice *advice = [self buildAdvice:service];
        QuysAdBannerService *serviceItem = (QuysAdBannerService*)service;
        advice.adviceView = serviceItem.adviceView;
        [self.delegate quys_SplashRequestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param service 广告请求服务类
- (void)quys_requestFial:(QuysAdBaseService*)service error:(NSError*)error;
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashRequestFial:error:)])
       {
           QuysSplashAdvice *advice = [self buildAdvice:service];
           [self.delegate quys_SplashRequestFial:advice error:error];
           
       }
}

/// 广告曝光
/// @param service 广告请求服务类
- (void)quys_interstitialOnExposure:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnExposure:)])
    {
        QuysSplashAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_SplashOnExposure:advice];
    }
}

/// 广告点击
/// @param service 广告请求服务类
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick service:(QuysAdBaseService*)service;
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnClickAdvice:)])
    {
        QuysSplashAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_SplashOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param service 广告请求服务类
- (void)quys_interstitialOnAdClose:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnAdClose:)])
    {
        QuysSplashAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_SplashOnAdClose:advice];
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
