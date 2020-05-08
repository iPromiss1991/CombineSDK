//
//  QuysAdSplashService.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysOpenScreenAdvice.h"
#import "QuysQYXOpenScreenAdvice.h"
#import "QuysGDTOpenScreenAdvice.h"

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
        QuysQYXOpenScreenAdvice *advice = [[QuysQYXOpenScreenAdvice alloc] initWithID:self.businessID key:self.bussinessKey launchScreenVC:self.launchScreenVC eventDelegate:self];
        self.advice = advice;
    }else if ([adviceInfo.channelName isEqualToString:k_ks_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_csj_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_wm_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_ylh_sdk])
    {
        
        QuysGDTOpenScreenAdvice *advice = [[QuysGDTOpenScreenAdvice alloc] initWithID:self.businessID key:self.bussinessKey launchScreenVC:self.launchScreenVC eventDelegate:self];
        self.advice = advice;
        
    }else if ([adviceInfo.channelName isEqualToString:k_baidu_sdk])
    {
        
    }

    
}
 

- (void)loadAdViewAndShow
{
    [self.advice loadAdViewAndShow];
    
}


#pragma mark - QuysOpenScreenAdviceDelegate

// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_OpenScreenRequestStart:(QuysOpenScreenAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenRequestStart:)])
    {
        [self.delegate quys_OpenScreenRequestStart:advice];
        
    }
}

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_OpenScreenRequestSuccess:(QuysOpenScreenAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenRequestSuccess:)])
    {
        [self.delegate quys_OpenScreenRequestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param advice 广告请求服务类
- (void)quys_OpenScreenRequestFial:(QuysOpenScreenAdvice*)advice error:(NSError*)error;
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenRequestFial:error:)])
       {

           [self.delegate quys_OpenScreenRequestFial:advice error:error];
           
       }
}

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_OpenScreenOnExposure:(QuysOpenScreenAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnExposure:)])
    {

        [self.delegate quys_OpenScreenOnExposure:advice];
    }
}

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_OpenScreenOnClickAdvice:(QuysOpenScreenAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnClickAdvice:)])
    {

        [self.delegate quys_OpenScreenOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_OpenScreenOnAdClose:(QuysOpenScreenAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnAdClose:)])
    {
        [self.delegate quys_OpenScreenOnAdClose:advice];
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
