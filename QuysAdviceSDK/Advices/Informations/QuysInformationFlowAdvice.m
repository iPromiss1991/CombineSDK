//
//  QuysInformationFlowAdvice.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysInformationFlowAdvice.h"
#import "QuysQYXInformationFlowAdvice.h"
 
@interface QuysInformationFlowAdvice()<QuysInformationFlowAdviceDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIViewController *presentViewController;

@property (nonatomic,strong) QuysInformationFlowBaseAdvice *advice;

@end


@implementation QuysInformationFlowAdvice

- (instancetype)initWithID:businessID key:bussinessKey cgRect:(CGRect)cgFrame eventDelegate:(nonnull id<QuysInformationFlowAdviceDelegate>)delegate  presentViewController:(UIViewController*)presentViewController
{
    if (self = [super init])
    {
        self.businessID = businessID;
        self.bussinessKey = bussinessKey;
        self.delegate = delegate;
        self.cgFrame = cgFrame;
        self.presentViewController = presentViewController;
        [self config];
    }return self;
}

#pragma mark - PrivateMethod


- (void)config
{
     
    QuysAdConfigManager *manager = [QuysAdConfigManager shareManager];
    QuysAdconfigResponseModelDataItemAdviceInfo* adviceInfo = [manager getAdviceByType:QuysConfigAdviceTypeBanner];
    if ([adviceInfo.channelName isEqualToString:k_qys_sdk])
    {
        QuysQYXInformationFlowAdvice *advice = [[QuysQYXInformationFlowAdvice alloc] initWithID:self.businessID key:self.bussinessKey
                                                cgRect:self.cgFrame eventDelegate:self presentViewController:self.presentViewController];
        self.advice = advice;
    }else if ([adviceInfo.channelName isEqualToString:k_ks_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_csj_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_wm_sdk])
    {
        
    }else if ([adviceInfo.channelName isEqualToString:k_ylh_sdk])
    {
    
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
- (UIView*)showAdView
{

    return [self.advice showAdView];
}
 

#pragma mark - QuysInformationFlowAdviceDelegate

// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_InformationFlowRequestStart:(QuysInformationFlowAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowRequestStart:)])
    {
        [self.delegate quys_InformationFlowRequestStart:advice];
        
    }
}

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_InformationFlowRequestSuccess:(QuysInformationFlowAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowRequestSuccess:)])
    {
        [self.delegate quys_InformationFlowRequestSuccess:advice];
        
    }
}


/// 广告请求失败
/// @param advice 广告请求服务类
- (void)quys_InformationFlowRequestFial:(QuysInformationFlowAdvice*)advice error:(NSError*)error;
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowRequestFial:error:)])
       {

           [self.delegate quys_InformationFlowRequestFial:advice error:error ];
           
       }
}

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_InformationFlowOnExposure:(QuysInformationFlowAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnExposure:)])
    {

        [self.delegate quys_InformationFlowOnExposure:advice];
    }
}

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_InformationFlowOnClickAdvice:(QuysInformationFlowAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnClickAdvice:)])
    {

        [self.delegate quys_InformationFlowOnClickAdvice:advice];
    }
}
/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_InformationFlowOnAdClose:(QuysInformationFlowAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    if ([self.delegate respondsToSelector:@selector(quys_InformationFlowOnAdClose:)])
    {
        [self.delegate quys_InformationFlowOnAdClose:advice];
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
