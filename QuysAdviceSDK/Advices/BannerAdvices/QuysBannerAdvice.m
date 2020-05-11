//
//  QuysBannerAdvice.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysBannerAdvice.h"
#import "QuysQYXBannerAdvice.h"
#import "QuysGDTBannerAdvice.h"

@interface QuysBannerAdvice()<QuysBannerAdviceDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

 @property (nonatomic,strong) UIViewController *currentViewController;

@property (nonatomic,strong) QuysBannerBaseAdvice *advice;

@end


@implementation QuysBannerAdvice

- (instancetype)initWithID:businessID key:bussinessKey cgRect:(CGRect)cgFrame eventDelegate:(nonnull id<QuysBannerAdviceDelegate>)delegate  viewController:(UIViewController*)currentViewController
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.cgFrame = cgFrame;
        self.currentViewController = currentViewController;
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
        QuysQYXBannerAdvice *advice = [[QuysQYXBannerAdvice alloc] initWithID:self.businessID key:self.bussinessKey cgRect:self.cgFrame eventDelegate:self presentViewController:self.currentViewController ];
        self.advice = advice;
    }else if ([adviceInfo.channelName isEqualToString:k_ks_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_csj_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_wm_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_ylh_sdk])
    {
        QuysGDTBannerAdvice *advice = [[QuysGDTBannerAdvice alloc ]initWithID:self.businessID key:self.bussinessKey cgRect:self.cgFrame eventDelegate:self presentViewController:self.currentViewController  adviceModel:adviceInfo];
        self.advice = advice;
    }else if ([adviceInfo.channelName isEqualToString:k_baidu_sdk])
    {
        
    }

    
}


- (void)loadAdViewAndShow;
{
    [self.advice loadAdViewAndShow];
}
 

#pragma mark - QuysBannerAdviceDelegate

// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_BannerRequestStart:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_BannerRequestStart:)])
    {
        [self.delegate quys_BannerRequestStart:advice];
        
    }
}

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_BannerRequestSuccess:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_BannerRequestSuccess:)])
    {
        [self.delegate quys_BannerRequestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param advice 广告请求服务类
- (void)quys_BannerRequestFial:(QuysBannerAdvice*)advice error:(NSError*)error;
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_BannerRequestFial:error:)])
       {

           [self.delegate quys_BannerRequestFial:advice error:error ];
           
       }
}

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_BannerOnExposure:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_BannerOnExposure:)])
    {

        [self.delegate quys_BannerOnExposure:advice];
    }
}

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_BannerOnClickAdvice:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_BannerOnClickAdvice:)])
    {

        [self.delegate quys_BannerOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_BannerOnAdClose:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_BannerOnAdClose:)])
    {
        [self.delegate quys_BannerOnAdClose:advice];
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
