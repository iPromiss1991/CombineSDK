//
//  QuysGDTBannerBaseAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/5/6.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysGDTBannerAdvice.h"
#import "QuysBannerAdvice.h"
@interface QuysGDTBannerAdvice()<GDTUnifiedBannerViewDelegate>
@property (nonatomic,strong) GDTUnifiedBannerView *adView;
@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIViewController *parentVC;

@end


@implementation QuysGDTBannerAdvice
- (instancetype)initWithID:businessID key:bussinessKey cgRect:(CGRect)cgFrame eventDelegate:(nonnull id<QuysSplashAdviceDelegate>)delegate parentViewController:(nonnull UIViewController *)parentVC
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.parentVC = parentVC;
        self.cgFrame = cgFrame;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据/TODO:
#ifdef IsReleaseVersion
    GDTUnifiedBannerView* adView = [[GDTUnifiedBannerView alloc]
                                    initWithFrame:self.cgFrame appId:self.businessID //TODO：appid
                                    placementId:self.bussinessKey
                                    viewController:self.parentVC];
#else
    GDTUnifiedBannerView* adView = [[GDTUnifiedBannerView alloc]
                                       initWithFrame:self.cgFrame appId:@"1105344611"//TODO：appid
                                       placementId:@"1080958885885321"
                                       viewController:self.parentVC];
    
#endif
    adView.accessibilityIdentifier = @"banner_ad";
    adView.animated = YES;
    adView.delegate = self;
    self.adView = adView;
    [self.parentVC.view addSubview:self.adView];

}


- (void)loadAdViewAndShow
{
    [self.adView loadAdAndShow];
}



#pragma mark - Method

- (QuysBannerAdvice*)buildAdvice
{
    QuysBannerAdvice *advice = (QuysBannerAdvice*)self.delegate;
    return advice;
}




#pragma mark - GDTUnifiedBannerViewDelegate
/**
 *  请求广告条数据成功后调用
 *  当接收服务器返回的广告数据成功后调用该函数
 */
- (void)unifiedBannerViewDidLoad:(GDTUnifiedBannerView *)unifiedBannerView
{
     
    NSLog(@"unified banner did load");
    QuysBannerAdvice *advice = [self buildAdvice];
    advice.adviceView = unifiedBannerView;
}

/**
 *  请求广告条数据失败后调用
 *  当接收服务器返回的广告数据失败后调用该函数
 */

- (void)unifiedBannerViewFailedToLoad:(GDTUnifiedBannerView *)unifiedBannerView error:(NSError *)error
{
     
    if ([self.delegate respondsToSelector:@selector(quys_requestFial:error:)])
       {
           QuysBannerAdvice *advice = [self buildAdvice];
           [self.delegate quys_requestFial:advice error:error];
       }
}

/**
 *  banner2.0曝光回调
 */
- (void)unifiedBannerViewWillExpose:(nonnull GDTUnifiedBannerView *)unifiedBannerView {
     
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnExposure:)])
    {
        QuysBannerAdvice *advice = [self buildAdvice];
        [self.delegate quys_interstitialOnExposure:advice];
    }
}

/**
 *  banner2.0点击回调
 */
- (void)unifiedBannerViewClicked:(GDTUnifiedBannerView *)unifiedBannerView
{
     
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnClickAdvice:)])
       {
           QuysBannerAdvice *advice = [self buildAdvice];
           [self.delegate quys_interstitialOnClickAdvice:advice];
       }
}

/**
 *  应用进入后台时调用
 *  当点击应用下载或者广告调用系统程序打开，应用将被自动切换到后台
 */
- (void)unifiedBannerViewWillLeaveApplication:(GDTUnifiedBannerView *)unifiedBannerView
{
     
}

/**
 *  全屏广告页已经被关闭
 */
- (void)unifiedBannerViewDidDismissFullScreenModal:(GDTUnifiedBannerView *)unifiedBannerView
{
     
}

/**
 *  全屏广告页即将被关闭
 */
- (void)unifiedBannerViewWillDismissFullScreenModal:(GDTUnifiedBannerView *)unifiedBannerView
{
     
}

/**
 *  banner2.0广告点击以后即将弹出全屏广告页
 */
- (void)unifiedBannerViewWillPresentFullScreenModal:(GDTUnifiedBannerView *)unifiedBannerView
{
     
}

/**
 *  banner2.0广告点击以后弹出全屏广告页完毕
 */
- (void)unifiedBannerViewDidPresentFullScreenModal:(GDTUnifiedBannerView *)unifiedBannerView
{
     
}

/**
 *  banner2.0被用户关闭时调用
 */
- (void)unifiedBannerViewWillClose:(nonnull GDTUnifiedBannerView *)unifiedBannerView
{
    self.adView = nil;
     
    if ([self.delegate respondsToSelector:@selector(quys_interstitialOnAdClose:)])
       {
           QuysBannerAdvice *advice = [self buildAdvice];
           [self.delegate quys_interstitialOnAdClose:advice];
       }
}


#pragma mark - Init



@end
