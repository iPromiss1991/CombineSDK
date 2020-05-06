//
//  QuysQYXBannerAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysQYXBannerAdvice.h"
#import "QuysBannerAdvice.h"
@interface QuysQYXBannerAdvice()<QuysAdSplashDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIViewController *parentVC;

 
@property (nonatomic,strong) QuysAdBannerService *service;

@end


@implementation QuysQYXBannerAdvice

- (instancetype)initWithID:businessID key:bussinessKey cgRect:(CGRect)cgFrame eventDelegate:(nonnull id<QuysSplashAdviceDelegate>)delegate                parentViewController:(UIViewController*)parentVC
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.parentVC = parentVC;
        self.cgFrame = cgFrame;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据

    QuysAdBannerService *service = [[QuysAdBannerService alloc] initWithID:self.businessID key:self.bussinessKey cgRect:self.cgFrame eventDelegate:self parentView:self.parentVC.view];
    self.service = service;
    
}


/// 开始加载视图 & 并展示
- (void)loadAdViewAndShow
{
    [self.service loadAdViewAndShow];
}
 
#pragma mark - Method

- (QuysBannerAdvice*)buildAdvice:(QuysAdBaseService*)service
{
    QuysBannerAdvice *advice = (QuysBannerAdvice*)self.delegate;
    return advice;
}




#pragma mark - QuysAdSplashDelegate

/// 开始发起广告请求
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestStart:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_requestStart:)])
    {
        QuysBannerAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_requestStart:advice];
        
    }
}

/// 广告请求成功
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestSuccess:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_requestSuccess:)])
    {
        QuysBannerAdvice *advice = [self buildAdvice:service];
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
           QuysBannerAdvice *advice = [self buildAdvice:service];
           [self.delegate quys_requestFial:advice error:error];
           
       }
}

/// 广告曝光
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnExposure:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnExposure:)])
    {
        QuysBannerAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_interstitialOnExposure:advice];
    }
}

/// 广告点击
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick service:(QuysAdBaseService*)service;
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnClickAdvice:)])
    {
        QuysBannerAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_interstitialOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnAdClose:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnAdClose:)])
    {
        QuysBannerAdvice *advice = [self buildAdvice:service];
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
