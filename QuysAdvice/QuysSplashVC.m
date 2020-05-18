
//
//  QuysSplashVC.m
//  QuysAdvice
//
//  Created by quys on 2020/5/18.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysSplashVC.h"
#import <QuysAdviceSDK/QuysSplashAdvice.h>
#import <Masonry/Masonry.h>

@interface QuysSplashVC ()<QuysSplashAdviceDelegate>
@property (nonatomic,strong)  QuysSplashAdvice* advice;
@property (nonatomic, strong) UIView *viewContain;//!< <#Explement #>
@property (nonatomic, strong) UIView *viewContainBottom;//!< <#Explement #>
@property (nonatomic, strong) UIView *adviceView;//!< <#Explement #>

@end

@implementation QuysSplashVC

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
    
    
    self.advice = [[QuysSplashAdvice alloc ]initWithID:self.businessID
                                                    key:self.businessKey
                                          eventDelegate:self
                                  presentViewController:self];
    
    [self.advice loadAdViewNow];
}



- (void)updateViewConstraints
{
    if (self.advice)
    {
        [self.viewContain mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).mas_offset(200);
            make.left.mas_equalTo(self.view).offset(10);
            make.right.mas_equalTo(self.view).offset(-10);
            make.bottom.mas_lessThanOrEqualTo(self.view);
            make.height.mas_greaterThanOrEqualTo(400);
        }];
        
        

            [self.viewContainBottom mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.viewContain).offset(10);
                make.left.mas_equalTo(self.viewContain).offset(10);
                make.right.mas_equalTo(self.viewContain).offset(-10);
                make.bottom.mas_equalTo(self.viewContain).offset(-10);
                make.height.mas_equalTo(50);
            }];
            
        
    }
    
    [super updateViewConstraints];
}


#pragma mark - QuysSplashAdviceDelegate


/// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_SplashRequestStart:(QuysSplashAdvice*)advice
{
    
    NSLog(@"%s",__FUNCTION__);
    
}

/// 广告请求成功 
/// @param advice 广告请求服务类
- (void)quys_SplashRequestSuccess:(QuysSplashAdvice*)advice
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
- (void)quys_SplashRequestFial:(QuysSplashAdvice*)advice error:(NSError*)error
{
    
    NSLog(@"\n%s  error;%@\n",__FUNCTION__,error);
    
}
/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_SplashOnExposure:(QuysSplashAdvice*)advice
{
    
    NSLog(@"%s",__FUNCTION__);
    
}
/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_SplashOnClickAdvice:(QuysSplashAdvice*)advice
{
    
    NSLog(@"%s",__FUNCTION__);
    
}

/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_SplashOnAdClose:(QuysSplashAdvice*)advice
{
    
    NSLog(@"%s",__FUNCTION__);
    
}

@end
