//
//  QuysQYXIncentiveVideoAdvice.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/26.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysGDTIncentiveVideoAdvice.h"
#import "QuysIncentiveVideoAdvice.h"
#import "GDTRewardVideoAd.h"
@interface QuysGDTIncentiveVideoAdvice()<GDTRewardedVideoAdDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
 
@property (nonatomic,strong) UIViewController *presentViewController;

 
@property (nonatomic,strong) GDTRewardVideoAd *advice;
@property (nonatomic,strong) QuysAdconfigResponseModelDataItemAdviceInfo *adviceInfo;

@end


@implementation QuysGDTIncentiveVideoAdvice

- (instancetype)initWithID:businessID key:bussinessKey   eventDelegate:(nonnull id<QuysIncentiveVideoAdviceDelegate>)delegate presentViewController:(nonnull UIViewController *)presentViewController adviceModel:(nonnull QuysAdconfigResponseModelDataItemAdviceInfo *)adviceInfo
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.presentViewController = presentViewController;
        self.adviceInfo = adviceInfo;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
    //配置并请求数据
    GDTRewardVideoAd *advice = [[GDTRewardVideoAd alloc] initWithAppId:@"1105344611" placementId:@"8020744212936426"];
    advice.videoMuted = NO;
    advice.delegate = self;
    self.advice = advice;
    
}

- (void)loadAdView
{
     [self.advice loadAd];
     //发起请求
      if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoRequestStart:)])
      {
          QuysIncentiveVideoAdvice *advice = [self buildAdvice];
           [self.delegate quys_IncentiveVideoRequestStart:advice];
      }

}



- (void)showAdView
{
    [self.advice showAdFromRootViewController:self.presentViewController];

}


#pragma mark - Method

- (QuysIncentiveVideoAdvice*)buildAdvice 
{
    QuysIncentiveVideoAdvice *advice = (QuysIncentiveVideoAdvice*)self.delegate;
    return advice;
}

#pragma mark - GDTRewardVideoAdDelegate
- (void)gdt_rewardVideoAdDidLoad:(GDTRewardVideoAd *)rewardedVideoAd
{
      if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoRequestSuccess:)])
           {
               QuysIncentiveVideoAdvice *advice = [self buildAdvice];
               advice.adviceView = self.adviceView;
               [self.delegate quys_IncentiveVideoRequestSuccess:advice];
           }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Request_Success];
}


- (void)gdt_rewardVideoAdVideoDidLoad:(GDTRewardVideoAd *)rewardedVideoAd
{
//    NSLog(@"%s",__FUNCTION__);
}


- (void)gdt_rewardVideoAdWillVisible:(GDTRewardVideoAd *)rewardedVideoAd
{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"视频播放页即将打开");
}

- (void)gdt_rewardVideoAdDidExposed:(GDTRewardVideoAd *)rewardedVideoAd
{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"广告已曝光");
    
      if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnExposure:)])
           {
               QuysIncentiveVideoAdvice *advice = [self buildAdvice];
                [self.delegate quys_IncentiveVideoOnExposure:advice];
               
           }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Expourse];
}

- (void)gdt_rewardVideoAdDidClose:(GDTRewardVideoAd *)rewardedVideoAd
{
//    NSLog(@"%s",__FUNCTION__);
////    广告关闭后释放ad对象
//    NSLog(@"广告已关闭");
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnAdClose:)])
         {
             QuysIncentiveVideoAdvice *advice = [self buildAdvice];
              [self.delegate quys_IncentiveVideoOnAdClose:advice];
             
         }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Close];

}


- (void)gdt_rewardVideoAdDidClicked:(GDTRewardVideoAd *)rewardedVideoAd
{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"广告已点击");
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoOnClickAdvice:)])
         {
             QuysIncentiveVideoAdvice *advice = [self buildAdvice];
              [self.delegate quys_IncentiveVideoOnClickAdvice:advice];
             
         }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Click];

}

- (void)gdt_rewardVideoAd:(GDTRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error
{
//    NSLog(@"%s",__FUNCTION__);
//    if (error.code == 4014)
//    {
//        NSLog(@"请拉取到广告后再调用展示接口");
//    } else if (error.code == 4016) {
//        NSLog(@"应用方向与广告位支持方向不一致");
//    } else if (error.code == 5012) {
//        NSLog(@"广告已过期");
//    } else if (error.code == 4015) {
//        NSLog(@"广告已经播放过，请重新拉取");
//    } else if (error.code == 5002) {
//        NSLog(@"视频下载失败");
//    } else if (error.code == 5003) {
//        NSLog(@"视频播放失败");
//    } else if (error.code == 5004) {
//        NSLog(@"没有合适的广告");
//    } else if (error.code == 5013) {
//        NSLog(@"请求太频繁，请稍后再试");
//    } else if (error.code == 3002) {
//        NSLog(@"网络连接超时");
//    }
//    NSLog(@"ERROR: %@", error);
    if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoRequestFial:error:)])
    {
        QuysIncentiveVideoAdvice *advice = [self buildAdvice];
         [self.delegate quys_IncentiveVideoRequestFial:advice error:error ];
        
    }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Request_Fail];
}

- (void)gdt_rewardVideoAdDidRewardEffective:(GDTRewardVideoAd *)rewardedVideoAd
{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"播放达到激励条件");
}

- (void)gdt_rewardVideoAdDidPlayFinish:(GDTRewardVideoAd *)rewardedVideoAd
{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"视频播放结束");
   if ([self.delegate respondsToSelector:@selector(quys_IncentiveVideoPlayEnd:)])
   {
       QuysIncentiveVideoAdvice *advice = [self buildAdvice];
        [self.delegate quys_IncentiveVideoPlayEnd:advice];
       
   }
    [[QuysReportApiTaskManager shareManager] buildAndAddRequestModel:self.adviceInfo eventType:QuysUploadEventType_Play_End];

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
