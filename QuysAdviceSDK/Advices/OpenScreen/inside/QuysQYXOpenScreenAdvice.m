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
    [self.service loadAdViewAndShow];//TODO:
    
}



#pragma mark - Method

- (QuysOpenScreenAdvice*)buildAdvice:(QuysAdBaseService*)service
{
    QuysOpenScreenAdvice *advice = (QuysOpenScreenAdvice*)self.delegate;
    return advice;
}




#pragma mark - QuysAdSplashDelegate

/// 开始发起广告请求
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestStart:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_requestStart:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_requestStart:advice];
        
    }
}

/// 广告请求成功
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestSuccess:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_requestSuccess:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        QuysAdOpenScreenService *serviceItem = (QuysAdOpenScreenService*)service;
        advice.adviceView = serviceItem.adviceView;
        [self.delegate quys_requestSuccess:advice];
        NSLog(@"\n\n\n\n\n\n\n请求成功\n\n\n\n\n\n\n");
    }
}


/// 广告请求失败
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_requestFial:(QuysAdBaseService*)service error:(NSError*)error;
{
    if ([self.delegate respondsToSelector:@selector(quys_requestFial:error:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_requestFial:advice error:error];
        
    }
}

/// 广告曝光
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnExposure:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnExposure:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_interstitialOnExposure:advice];
    }
}

/// 广告点击
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnClick:(CGPoint)cpClick  relativeClickPoint:(CGPoint)reClick service:(QuysAdBaseService*)service;
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnClick:relativeClickPoint:service:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_interstitialOnClick:cpClick relativeClickPoint:cpClick service:advice];
    }
}
/// 广告关闭
/// @param service 广告请求服务基类（实际接收时转换为响应的类即可）
- (void)quys_interstitialOnAdClose:(QuysAdBaseService*)service
{
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnAdClose:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice:service];
        [self.delegate quys_interstitialOnAdClose:advice];
    }
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
