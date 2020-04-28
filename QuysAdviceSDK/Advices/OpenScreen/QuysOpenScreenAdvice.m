//
//  QuysAdSplashService.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysOpenScreenAdvice.h"
#import "QuysQYXOpenScreenAdvice.h"

@interface QuysOpenScreenAdvice()<QuysOpenScreenAdviceDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,strong) UIViewController *launchScreenVC;


@property (nonatomic,strong) QuysOpenScreenBaseAdvice *advice;

@end


@implementation QuysOpenScreenAdvice

- (instancetype)initWithID:businessID key:bussinessKey  launchScreenVC:(nonnull UIViewController *)launchScreenVC eventDelegate:(nonnull id<QuysOpenScreenAdviceDelegate>)delegate
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.launchScreenVC = launchScreenVC;
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
        QuysQYXOpenScreenAdvice *service = [[QuysQYXOpenScreenAdvice alloc] initWithID:self.businessID key:self.bussinessKey launchScreenVC:self.launchScreenVC eventDelegate:self];
        self.advice = service;
    }else if ([adviceInfo.channelName isEqualToString:K_ks_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_csj_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_wm_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_ylh_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_baidu_sdk])
    {
        
    }

    
}
 

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


- (void)quys_videoPlayEnd:(nonnull QuysBaseAdvice *)service {

}

- (void)quys_videoPlaystart:(nonnull QuysBaseAdvice *)service {

}


#pragma mark - Init
-(UIWindow *)adviceView
{
    if (_adviceView == nil)
    {
        _adviceView.windowLevel = UIWindowLevelAlert - 1;
        UIViewController *rootVC = [UIViewController new];
        _adviceView.rootViewController = rootVC;
    }return _adviceView;
}


-(void)dealloc
{
    
}


@end