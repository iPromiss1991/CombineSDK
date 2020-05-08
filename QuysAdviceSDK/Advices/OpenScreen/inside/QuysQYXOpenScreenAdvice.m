//
//  QuysQYXOpenScreenAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysQYXOpenScreenAdvice.h"
#import "QuysOpenScreenAdvice.h"
@interface QuysQYXOpenScreenAdvice()<QuysAdviceOpeenScreenDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;

@property (nonatomic,strong) UIViewController *launchScreenVC;


@property (nonatomic,strong) QuysAdOpenScreenService *service;

@end


@implementation QuysQYXOpenScreenAdvice

- (instancetype)initWithID:businessID
                       key:bussinessKey
            launchScreenVC:(UIViewController*)launchScreenVC
             eventDelegate:(nonnull id<QuysOpenScreenAdviceDelegate>)delegate
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.launchScreenVC = launchScreenVC;
        self.delegate = delegate;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据
    
    QuysAdOpenScreenService *service = [[QuysAdOpenScreenService alloc] initWithID:self.businessID key:self.bussinessKey launchScreenVC:self.launchScreenVC eventDelegate:self];
    service.bgShowDuration = 1;
    self.service = service;
    
}

 /// 发起请求
- (void)loadAdViewAndShow
{
    [self.service loadAdViewAndShow]; 
    
}



#pragma mark - Method

- (QuysOpenScreenAdvice*)buildAdvice:(QuysAdBaseService*)service
{
    QuysOpenScreenAdvice *advice = (QuysOpenScreenAdvice*)self.delegate;
    return advice;
}




#pragma mark - QuysAdSplashDelegate

/// 开始发起广告请求
/// @param service 广告请求服务类
- (void)quys_requestStart:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenRequestStart:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_OpenScreenRequestStart:advice];
        
    }
}

/// 广告请求成功
/// @param service 广告请求服务类
- (void)quys_requestSuccess:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenRequestSuccess:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        QuysAdOpenScreenService *serviceItem = (QuysAdOpenScreenService*)service;
        advice.adviceView = serviceItem.adviceView;
        [self.delegate quys_OpenScreenRequestSuccess:advice];
    }
}


/// 广告请求失败
/// @param service 广告请求服务类
- (void)quys_requestFial:(QuysAdBaseService*)service error:(NSError*)error;
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenRequestFial:error:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_OpenScreenRequestFial:advice error:error];
        
    }
}

/// 广告曝光
/// @param service 广告请求服务类
- (void)quys_interstitialOnExposure:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnExposure:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_OpenScreenOnExposure:advice];
    }
}

/// 广告点击
/// @param service 广告请求服务类
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick service:(QuysAdBaseService*)service;
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnClickAdvice:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_OpenScreenOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param service 广告请求服务类
- (void)quys_interstitialOnAdClose:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnAdClose:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_OpenScreenOnAdClose:advice];
    }
}


//- (void)quys_videoPlaystart:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_videoPlaystart:)])
//    {
//        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_videoPlaystart:advice];
//    }
//}
//
//
//- (void)quys_videoPlayEnd:(nonnull QuysAdBaseService *)service
//{
//    if ([self.delegate respondsToSelector:@selector(quys_videoPlayEnd:)])
//    {
//        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
//        [self.delegate quys_videoPlayEnd:advice];
//    }
//}



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
