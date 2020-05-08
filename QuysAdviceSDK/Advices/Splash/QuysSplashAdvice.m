//
//  QuysAdSplashService.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysSplashAdvice.h"
#import "QuysQYXSplashAdvice.h"
#import "QuysGDTSplashAdvice.h"

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
        QuysGDTSplashAdvice *advice = [[QuysGDTSplashAdvice alloc] initWithID:self.businessID key:self.bussinessKey cgRect:self.cgFrame eventDelegate:self parentView:self.parentView];
        self.advice = advice;
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
- (void)showAdView
{

     [self.advice showAdView];
}
 


#pragma mark - QuysAdSplashDelegate

// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_SplashRequestStart:(QuysSplashAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_SplashRequestStart:)])
    {
        [self.delegate quys_SplashRequestStart:advice];
        
    }
}

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_SplashRequestSuccess:(QuysSplashAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_SplashRequestSuccess:)])
    {
        [self.delegate quys_SplashRequestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param advice 广告请求服务类
- (void)quys_SplashRequestFial:(QuysSplashAdvice*)advice error:(NSError*)error;
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_SplashRequestFial:error:)])
       {

           [self.delegate quys_SplashRequestFial:advice error:error];
           
       }
}

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_SplashOnExposure:(QuysSplashAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnExposure:)])
    {

        [self.delegate quys_SplashOnExposure:advice];
    }
}

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_SplashOnClickAdvice:(QuysSplashAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnClickAdvice:)])
    {

        [self.delegate quys_SplashOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_SplashOnAdClose:(QuysSplashAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnAdClose:)])
    {
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
