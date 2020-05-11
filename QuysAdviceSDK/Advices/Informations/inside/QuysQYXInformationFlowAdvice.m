//
//  QuysQYXInformationFlowAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysQYXInformationFlowAdvice.h"
#import "QuysInformationFlowAdvice.h"
@interface QuysQYXInformationFlowAdvice()<QuysAdSplashDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIViewController *presentViewController;

 
@property (nonatomic,strong) QuysInformationFlowService *service;

@end


@implementation QuysQYXInformationFlowAdvice

- (instancetype)initWithID:businessID key:bussinessKey cgRect:(CGRect)cgFrame eventDelegate:(nonnull id<QuysInformationFlowAdviceDelegate>)delegate presentViewController:(nonnull UIViewController *)presentViewController
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.presentViewController = presentViewController;
        self.cgFrame = cgFrame;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据

    QuysInformationFlowService *service = [[QuysInformationFlowService alloc] initWithID:self.businessID key:self.bussinessKey cgRect:self.cgFrame eventDelegate:self presentVCiewController:self.presentViewController];
    self.service = service;
    
}


/// 发起请求
- (void)loadAdViewNow
{
    [self.service loadAdViewNow];
    
}


/// 开始展示视图
- (UIView*)showAdView
{

    return [self.service showAdView];
}
 
#pragma mark - Method

- (QuysInformationFlowAdvice*)buildAdvice:(QuysAdBaseService*)service
{
    QuysInformationFlowAdvice *advice = (QuysInformationFlowAdvice*)self.delegate;
    return advice;
}




#pragma mark - QuysAdSplashDelegate

/// 开始发起广告请求
/// @param service 广告请求服务类
- (void)quys_requestStart:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowRequestStart:)])
    {
        QuysInformationFlowAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_InformationFlowRequestStart:advice];
        
    }
}

/// 广告请求成功
/// @param service 广告请求服务类
- (void)quys_requestSuccess:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowRequestSuccess:)])
    {
        QuysInformationFlowAdvice *advice = [self buildAdvice:service];
        QuysAdBannerService *serviceItem = (QuysAdBannerService*)service;
        advice.adviceView = serviceItem.adviceView;
        [self.delegate quys_InformationFlowRequestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param service 广告请求服务类
- (void)quys_requestFial:(QuysAdBaseService*)service error:(NSError*)error;
{
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowRequestFial:error:)])
       {
           QuysInformationFlowAdvice *advice = [self buildAdvice:service];
           [self.delegate quys_InformationFlowRequestFial:advice error:error];
           
       }
}

/// 广告曝光
/// @param service 广告请求服务类
- (void)quys_interstitialOnExposure:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnExposure:)])
    {
        QuysInformationFlowAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_InformationFlowOnExposure:advice];
    }
}

/// 广告点击
/// @param service 广告请求服务类
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick service:(QuysAdBaseService*)service;
{
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnClickAdvice:)])
    {
        QuysInformationFlowAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_InformationFlowOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param service 广告请求服务类
- (void)quys_interstitialOnAdClose:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnAdClose:)])
    {
        QuysInformationFlowAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_InformationFlowOnAdClose:advice];
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
