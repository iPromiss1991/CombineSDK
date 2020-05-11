//
//  QuysQYXInformationFlowAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysGDTInformationFlowAdvice.h"
#import "QuysInformationFlowAdvice.h"
#import "GDTNativeExpressAd.h"
#import "GDTNativeExpressAdView.h"
@interface QuysGDTInformationFlowAdvice()<GDTNativeExpressAdDelegete>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIViewController *presentViewController;


@property (nonatomic, strong) GDTNativeExpressAd *advice;
@property (nonatomic,strong) QuysAdconfigResponseModelDataItemAdviceInfo *adviceInfo;

@end


@implementation QuysGDTInformationFlowAdvice

- (instancetype)initWithID:businessID key:bussinessKey cgRect:(CGRect)cgFrame eventDelegate:(nonnull id<QuysInformationFlowAdviceDelegate>)delegate presentViewController:(nonnull UIViewController *)presentViewController adviceModel:(nonnull QuysAdconfigResponseModelDataItemAdviceInfo *)adviceInfo
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.cgFrame = cgFrame;
        self.delegate = delegate;
        self.presentViewController = presentViewController;
        self.adviceInfo = adviceInfo;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据/TODO:
#ifdef IsReleaseVersion
    GDTNativeExpressAd* advice = [[GDTUnifiedBannerView alloc]
                                    initWithFrame:self.cgFrame appId:self.businessID //TODO：appid
                                    placementId:self.bussinessKey
                                    viewController:self.parentVC];
#else
    GDTNativeExpressAd* advice = [[GDTNativeExpressAd alloc] initWithAppId:@"1105344611"
    placementId:@"5030722621265924"
         adSize:CGSizeMake(self.cgFrame.size.width, self.cgFrame.size.height)];
    
#endif
    advice.delegate = self;
    advice.detailPageVideoMuted = YES;//视频详情页播放时是否静音。默认NO。loadAd 前设置。
    advice.videoAutoPlayOnWWAN = NO;//*  非 WiFi 网络，是否自动播放。默认 NO。loadAd 前设置。
    advice.videoMuted = NO;// *  自动播放时，是否静音。默认 YES。loadAd 前设置。
    self.advice = advice;
}


- (void)loadAdViewNow
{
    [self.advice loadAd:1];//拉取广告数量
}

-(UIView *)showAdView
{
    [self.presentViewController.view addSubview:self.adviceView];
    return self.adviceView;
}

#pragma mark - Method

- (QuysInformationFlowAdvice*)buildAdvice
{
    QuysInformationFlowAdvice *advice = (QuysInformationFlowAdvice*)self.delegate;
    return advice;
}

#pragma mark - GDTNativeExpressAdDelegete
/**
 * 拉取广告成功的回调
 */
- (void)nativeExpressAdSuccessToLoad:(GDTNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof GDTNativeExpressAdView *> *)views
{
  if (views.count)
  {
       [views enumerateObjectsUsingBlock:^(GDTNativeExpressAdView*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           GDTNativeExpressAdView *expressView = (GDTNativeExpressAdView *)obj;
           expressView.controller = self.presentViewController;
           [expressView render];
           self.adviceView = expressView;
       }];
   }
      if ([self.delegate respondsToSelector:@selector(quys_InformationFlowRequestSuccess:)])
       {
           QuysInformationFlowAdvice *advice = [self buildAdvice];
           advice.adviceView = self.adviceView;
           [self.delegate quys_InformationFlowRequestSuccess:advice];
           
       }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Request_Success];
}


/**
 * 拉取原生模板广告失败
 */
- (void)nativeExpressAdFailToLoad:(GDTNativeExpressAd *)nativeExpressAd error:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowRequestFial:error:)])
    {
        QuysInformationFlowAdvice *advice = [self buildAdvice];
        [self.delegate quys_InformationFlowRequestFial:advice error:error ];
    }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Request_Fail];

 }

- (void)nativeExpressAdViewRenderSuccess:(GDTNativeExpressAdView *)nativeExpressAdView
{

}

- (void)nativeExpressAdViewClicked:(GDTNativeExpressAdView *)nativeExpressAdView
{
         if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnClickAdvice:)])
             {
                 QuysInformationFlowAdvice *advice = [self buildAdvice];
                 [self.delegate quys_InformationFlowOnClickAdvice:advice];
             }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Click];

}

- (void)nativeExpressAdViewClosed:(GDTNativeExpressAdView *)nativeExpressAdView
{
    [self.adviceView removeFromSuperview];
    self.adviceView = nil;
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnAdClose:)])
    {
        QuysInformationFlowAdvice *advice = [self buildAdvice];
        [self.delegate quys_InformationFlowOnAdClose:advice];
    }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Close];

 
}

- (void)nativeExpressAdViewExposure:(GDTNativeExpressAdView *)nativeExpressAdView
{
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnExposure:)])
    {
        QuysInformationFlowAdvice *advice = [self buildAdvice];
        [self.delegate quys_InformationFlowOnExposure:advice ];
    }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Expourse];

}

- (void)nativeExpressAdViewWillPresentScreen:(GDTNativeExpressAdView *)nativeExpressAdView
{

}

- (void)nativeExpressAdViewDidPresentScreen:(GDTNativeExpressAdView *)nativeExpressAdView
{

}

- (void)nativeExpressAdViewWillDissmissScreen:(GDTNativeExpressAdView *)nativeExpressAdView
{

}

- (void)nativeExpressAdView:(GDTNativeExpressAdView *)nativeExpressAdView playerStatusChanged:(GDTMediaPlayerStatus)status
{

    
}

- (void)nativeExpressAdViewWillPresentVideoVC:(GDTNativeExpressAdView *)nativeExpressAdView
{

}

- (void)nativeExpressAdViewDidPresentVideoVC:(GDTNativeExpressAdView *)nativeExpressAdView
{

}
- (void)nativeExpressAdViewWillDismissVideoVC:(GDTNativeExpressAdView *)nativeExpressAdView
{

}
- (void)nativeExpressAdViewDidDismissVideoVC:(GDTNativeExpressAdView *)nativeExpressAdView
{

}

- (void)nativeExpressAdViewDidDissmissScreen:(GDTNativeExpressAdView *)nativeExpressAdView
{

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
