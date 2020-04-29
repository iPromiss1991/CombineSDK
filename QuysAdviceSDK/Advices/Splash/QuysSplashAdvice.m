//
//  QuysAdSplashService.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysSplashAdvice.h"
#import "QuysQYXSplashAdvice.h"

@interface QuysSplashAdvice()<QuysSplashAdviceDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIView *parentView;
 
@property (nonatomic,strong) QuysSplashBaseAdvice *advice;

@end


@implementation QuysSplashAdvice

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
    //TODO:配置并请求数据
    QuysAdConfigManager *manager = [QuysAdConfigManager shareManager];
    QuysAdconfigResponseModelDataItemAdviceInfo* adviceInfo = [manager getAdviceByType:QuysConfigAdviceTypeBanner];
    if ([adviceInfo.channelName isEqualToString:k_qys_sdk])
    {
        QuysQYXSplashAdvice *advice = [[QuysQYXSplashAdvice alloc] initWithID:self.businessID key:self.bussinessKey cgRect:self.cgFrame eventDelegate:self parentView:self.parentView];
        self.advice = advice;
    }else if ([adviceInfo.channelName isEqualToString:k_ks_sdk])
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


/// 发起请求
- (void)loadAdViewNow
{
    [self.advice loadAdViewNow];
    
}


/// 开始展示视图
- (UIView*)showAdView
{

    return [self.advice showAdView];
}
 

#pragma mark - QuysAdSplashDelegate

// 开始发起广告请求
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestStart:(QuysBaseAdvice*)advice
{
    if ([self.delegate respondsToSelector:@selector(quys_requestStart:)])
    {
        [self.delegate quys_requestStart:advice];
        
    }
}

/// 广告请求成功
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestSuccess:(QuysBaseAdvice*)advice
{
    if ([self.delegate respondsToSelector:@selector(quys_requestSuccess:)])
    {
        [self.delegate quys_requestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestFial:(QuysBaseAdvice*)advice error:(NSError*)error;
{
    if ([self.delegate respondsToSelector:@selector(quys_requestFial:error:)])
       {

           [self.delegate quys_requestFial:advice error:error];
           
       }
}

/// 广告曝光
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnExposure:(QuysBaseAdvice*)advice
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnExposure:)])
    {

        [self.delegate quys_interstitialOnExposure:advice];
    }
}

/// 广告点击
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick advice:(QuysBaseAdvice*)advice;
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnClick:relativeClickPoint:advice:)])
    {

        [self.delegate quys_interstitialOnClick:cpClick relativeClickPoint:cpClick advice:advice];
    }
}
/// 广告关闭
/// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnAdClose:(QuysBaseAdvice*)advice
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnAdClose:)])
    {
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
