
//
//  QuysIncentiveVideoVC.m
//  QuysAdvice
//
//  Created by quys on 2020/5/18.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysIncentiveVideoVC.h"
#import <QuysAdviceSDK/QuysIncentiveVideoAdvice.h>
#import <Masonry/Masonry.h>

@interface QuysIncentiveVideoVC ()<QuysIncentiveVideoAdviceDelegate>
@property (nonatomic,strong)  QuysIncentiveVideoAdvice * advice;
@property (nonatomic, strong) UIView *viewContain;//!< <#Explement #>
@property (nonatomic, strong) UIView *viewContainBottom;//!< <#Explement #>
@property (nonatomic, strong) UIView *adviceView;//!< <#Explement #>

@end

@implementation QuysIncentiveVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIView *viewContain = [[UIView alloc]init];
    viewContain.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewContain];
    self.viewContain=  viewContain;
    
    UIView *viewContainBottom = [[UIView alloc]init];
    viewContainBottom.backgroundColor = [UIColor purpleColor];
    [self.viewContain addSubview:viewContainBottom];
    self.viewContainBottom =  viewContainBottom;
    
}



- (void)updateViewConstraints
{
    if (self.advice)
    {
        [self.viewContain mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).mas_offset(200);
            make.left.right.mas_equalTo(self.view);
            make.bottom.mas_lessThanOrEqualTo(self.view);
            make.height.mas_greaterThanOrEqualTo(400);
        }];
        
        [self.viewContainBottom mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.viewContain).offset(200);
            make.left.right.mas_equalTo(self.viewContain);
            make.bottom.mas_equalTo(self.viewContain).offset(-10);
            make.height.mas_equalTo(50);
        }];
    }
    
    [super updateViewConstraints];
}


#pragma mark - QuysIncentiveVideoAdviceDelegate

/// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoRequestStart:(QuysIncentiveVideoAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}

/// 广告请求成功
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoRequestSuccess:(QuysIncentiveVideoAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    [self.advice showAdView];
    self.adviceView = self.advice.adviceView;
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}
/// 广告请求失败
/// @param advice 广告请求服务类
/// @param error 失败信息
- (void)quys_IncentiveVideoRequestFial:(QuysIncentiveVideoAdvice*)advice error:(NSError*)error
{
    NSLog(@"\n%s  error;%@\n",__FUNCTION__,error);

}

/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoOnExposure:(QuysIncentiveVideoAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}

/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoOnClickAdvice:(QuysIncentiveVideoAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}

/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoOnAdClose:(QuysIncentiveVideoAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}

/// 广告开始播放
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoPlaystart:(QuysIncentiveVideoAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}

/// 广告播放结束
/// @param advice 广告请求服务类
- (void)quys_IncentiveVideoPlayEnd:(QuysIncentiveVideoAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
 
        self.advice = [[QuysIncentiveVideoAdvice alloc]initWithID:self.businessID//@""
                                                               key:self.businessKey//@""
                                                     eventDelegate:self presentViewController:self ];
    
        [self.advice  loadAdView];
  
 
}


@end
