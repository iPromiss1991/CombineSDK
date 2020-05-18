//
//  QuysBannerVC.m
//  QuysAdvice
//
//  Created by quys on 2020/5/18.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysBannerVC.h"
#import <QuysAdviceSDK/QuysBannerAdvice.h>
#import <Masonry/Masonry.h>

@interface QuysBannerVC ()<QuysBannerAdviceDelegate>
@property (nonatomic,strong)  QuysBannerAdvice * advice;
@property (nonatomic, strong) UIView *viewContain;//!< <#Explement #>
@property (nonatomic, strong) UIView *viewContainBottom;//!< <#Explement #>
@property (nonatomic, strong) UIView *adviceView;//!< <#Explement #>

@end

@implementation QuysBannerVC

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
        
    
    self.advice = [[QuysBannerAdvice alloc ]initWithID:self.businessID
                                                    key:self.businessKey
                                                 cgRect:CGRectMake(0, 64,[UIScreen mainScreen].bounds.size.width , 100)
                                          eventDelegate:self
                                         viewController:self];
    
    [self.advice loadAdViewAndShow];
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
        [self.adviceView mas_updateConstraints:^(MASConstraintMaker *make) {
               make.top.mas_equalTo(self.viewContain).offset(20);
               make.left.right.mas_equalTo(self.viewContain);
           }];
           
        
        [self.viewContainBottom mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.adviceView.mas_bottom).offset(200);
            make.left.mas_equalTo(self.viewContain).offset(10);
            make.right.mas_equalTo(self.viewContain).offset(-10);
            make.bottom.mas_equalTo(self.viewContain).offset(-10);
            make.height.mas_equalTo(50);
        }];
    }
    
    [super updateViewConstraints];
}


#pragma mark - QuysBannerAdviceDelegate

/// 开始发起广告请求
/// @param advice 广告请求服务类
- (void)quys_BannerRequestStart:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
}
/// 广告请求成功（eg：建议在该方法中或者之后再   展示广告）
/// @param advice 广告请求服务类
- (void)quys_BannerRequestSuccess:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    self.adviceView = self.advice.adviceView;
    [self.viewContain addSubview:self.adviceView];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
}
/// 广告请求失败
/// @param advice 广告请求服务类
/// @param error 失败信息
- (void)quys_BannerRequestFial:(QuysBannerAdvice*)advice error:(NSError*)error
{
    NSLog(@"\n%s  error;%@\n",__FUNCTION__,error);

}
/// 广告曝光
/// @param advice 广告请求服务类
- (void)quys_BannerOnExposure:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}
/// 广告点击
/// @param advice 广告请求服务类
- (void)quys_BannerOnClickAdvice:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}
/// 广告关闭
/// @param advice 广告请求服务类
- (void)quys_BannerOnAdClose:(QuysBannerAdvice*)advice
{
    NSLog(@"%s",__FUNCTION__);
    
}
@end
