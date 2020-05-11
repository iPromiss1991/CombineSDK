//
//  QuysQYXOpenScreenAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysGDTOpenScreenAdvice.h"
#import "QuysOpenScreenAdvice.h"
#import "GDTSplashAd.h"
@interface QuysGDTOpenScreenAdvice()<GDTSplashAdDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;

@property (nonatomic,strong) UIViewController *launchScreenVC;
@property (nonatomic,strong)  GDTSplashAd *advice;
@property (nonatomic,strong) QuysAdconfigResponseModelDataItemAdviceInfo *adviceInfo;


@end


@implementation QuysGDTOpenScreenAdvice

- (instancetype)initWithID:businessID
                       key:bussinessKey
            launchScreenVC:(UIViewController*)launchScreenVC
             eventDelegate:(nonnull id<QuysOpenScreenAdviceDelegate>)delegate adviceModel:(nonnull QuysAdconfigResponseModelDataItemAdviceInfo *)adviceInfo
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.launchScreenVC = launchScreenVC;
        self.delegate = delegate;
        self.adviceInfo = adviceInfo;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据
    #ifdef IsReleaseVersion
        GDTSplashAd *advice =  [[GDTSplashAd alloc] initWithAppId:self.businessID
                                                    placementId:self.bussinessKey];
    #else
          GDTSplashAd *advice =  [[GDTSplashAd alloc] initWithAppId:@"1105344611"
                                                    placementId:@"9040714184494018"];
        
    #endif

    advice.delegate = self;
    advice.fetchDelay = 2;
    advice.backgroundImage = [UIImage convertViewToImage:self.launchScreenVC.view];
    self.advice = advice;
    
}

 /// 发起请求
- (void)loadAdViewAndShow
{
    [self.advice loadAdAndShowInWindow:[UIApplication sharedApplication].delegate.window];
}



#pragma mark - Method


- (QuysOpenScreenAdvice*)buildAdvice
{
    QuysOpenScreenAdvice *advice = (QuysOpenScreenAdvice*)self.delegate;
    return advice;
}


#pragma mark - GDTSplashAdDelegate

- (void)splashAdDidLoad:(GDTSplashAd *)splashAd
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenRequestStart:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice];
        [self.delegate quys_OpenScreenRequestStart:advice];
    }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Request_Success];

}

- (void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd
{
}

- (void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error
{
   
}

- (void)splashAdExposured:(GDTSplashAd *)splashAd
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnExposure:)])
             {
                 QuysOpenScreenAdvice *advice = [self buildAdvice];
                 [self.delegate quys_OpenScreenOnExposure:advice ];
             }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Expourse];

}

- (void)splashAdClicked:(GDTSplashAd *)splashAd
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnClickAdvice:)])
    {
        QuysOpenScreenAdvice *advice = [self buildAdvice];
        [self.delegate quys_OpenScreenOnClickAdvice:advice];
    }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Click];

}

- (void)splashAdApplicationWillEnterBackground:(GDTSplashAd *)splashAd
{
}

- (void)splashAdWillClosed:(GDTSplashAd *)splashAd
{

}

- (void)splashAdClosed:(GDTSplashAd *)splashAd
{
    if ([self.delegate respondsToSelector:@selector(quys_OpenScreenOnAdClose:)])
       {
           QuysOpenScreenAdvice *advice = [self buildAdvice];
           [self.delegate quys_OpenScreenOnAdClose:advice];
       }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Close];

   self.advice = nil;
}

- (void)splashAdWillPresentFullScreenModal:(GDTSplashAd *)splashAd
{
}

- (void)splashAdDidPresentFullScreenModal:(GDTSplashAd *)splashAd
{
}

- (void)splashAdWillDismissFullScreenModal:(GDTSplashAd *)splashAd
{
}

- (void)splashAdDidDismissFullScreenModal:(GDTSplashAd *)splashAd
{
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
