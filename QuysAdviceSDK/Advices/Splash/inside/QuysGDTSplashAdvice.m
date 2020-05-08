//
//  QuysQYXSplashAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysGDTSplashAdvice.h"
#import "QuysSplashAdvice.h"
#import <quysAdvice.h>
#import "GDTUnifiedInterstitialAd.h"
@interface QuysGDTSplashAdvice()<GDTUnifiedInterstitialAdDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIView *parentView;
@property (nonatomic,strong) GDTUnifiedInterstitialAd *advice;

@end


@implementation QuysGDTSplashAdvice

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
    //配置并请求数据/TODO:
#ifdef IsReleaseVersion
    GDTUnifiedInterstitialAd* advice = [[GDTUnifiedInterstitialAd alloc]initWithAppId:self.businessID //TODO：appid
                                    placementId:self.bussinessKey
                                 ];
#else
    GDTUnifiedInterstitialAd* advice = [[GDTUnifiedInterstitialAd alloc] initWithAppId:@"1105344611"//TODO：appid
                                       placementId:@"1050652855580392"
                                        ];
    
#endif
    advice.delegate = self;
    self.advice = advice;
}


/// 发起请求
- (void)loadAdViewNow
{
    [self.advice loadAd];
    
}


/// 开始展示视图
- (void)showAdView
{

    [self.advice presentAdFromRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
 }
 
#pragma mark - Method

- (QuysSplashAdvice*)buildAdvice
{
    QuysSplashAdvice *advice = (QuysSplashAdvice*)self.delegate;
    return advice;
}

#pragma mark - GDTUnifiedInterstitialAdDelegate


- (void)unifiedInterstitialSuccessToLoadAd:(GDTUnifiedInterstitialAd *)unifiedInterstitial
{
     if ([self.delegate respondsToSelector:@selector(quys_SplashRequestSuccess:)])
     {
         QuysSplashAdvice *advice = [self buildAdvice];
         [self.delegate quys_SplashRequestSuccess:advice];
         
     }

}

- (void)unifiedInterstitialFailToLoadAd:(GDTUnifiedInterstitialAd *)unifiedInterstitial error:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashRequestFial:error:)])
          {
              QuysSplashAdvice *advice = [self buildAdvice];
              [self.delegate quys_SplashRequestFial:advice error:error];
          }
}

- (void)unifiedInterstitialWillExposure:(GDTUnifiedInterstitialAd *)unifiedInterstitial
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnExposure:)])
          {
              QuysSplashAdvice *advice = [self buildAdvice];
              [self.delegate quys_SplashOnExposure:advice ];
          }
}

- (void)unifiedInterstitialClicked:(GDTUnifiedInterstitialAd *)unifiedInterstitial
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnClickAdvice:)])
         {
             QuysSplashAdvice *advice = [self buildAdvice];
             [self.delegate quys_SplashOnClickAdvice:advice];
         }
}

- (void)unifiedInterstitialAdDidDismissFullScreenModal:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
{
    if ([self.delegate respondsToSelector:@selector(quys_SplashOnAdClose:)])
       {
           QuysSplashAdvice *advice = [self buildAdvice];
           [self.delegate quys_SplashOnAdClose:advice];
       }
}

/*
- (void)unifiedInterstitialWillPresentScreen:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialDidPresentScreen:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialDidDismissScreen:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialWillLeaveApplication:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialClicked:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialAdWillPresentFullScreenModal:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialAdDidPresentFullScreenModal:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialAdWillDismissFullScreenModal:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialAdDidDismissFullScreenModal:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialAd:(GDTUnifiedInterstitialAd *)unifiedInterstitial playerStatusChanged:(GDTMediaPlayerStatus)status;
- (void)unifiedInterstitialAdViewWillPresentVideoVC:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialAdViewDidPresentVideoVC:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialAdViewWillDismissVideoVC:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
- (void)unifiedInterstitialAdViewDidDismissVideoVC:(GDTUnifiedInterstitialAd *)unifiedInterstitial;
 */


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
