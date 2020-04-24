//
//  QuysAdSplashService.m
//  quysAdvice
//
//  Created by quys on 2019/12/9.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysBannerAdvice.h"
#import <quysAdvice/quysAdvice.h>

@interface QuysBannerAdvice()<QuysAdSplashDelegate>

@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *bussinessKey;
@property (nonatomic,assign) CGRect cgFrame;

@property (nonatomic,strong) UIView *parentView;

 
@property (nonatomic,strong) QuysAdBannerService *service;

@end


@implementation QuysBannerAdvice

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
    //配置并请求数据

    QuysAdBannerService *service = [[QuysAdBannerService alloc] initWithID:self.businessID key:self.bussinessKey cgRect:self.cgFrame eventDelegate:self parentView:self.parentView];
    [service loadAdViewNow];
    self.service = service;
    
}


/// 发起请求
- (void)loadAdViewNow
{
     
    
}


/// 开始展示视图
- (UIView*)showAdView
{
    
    return nil;
}
 

#pragma mark - QuysAdSplashDelegate

- (void)quys_requestStart:(QuysAdBaseService *)service
{
    
}

-(void)quys_requestSuccess:(QuysAdBaseService *)service
{
    
}

-(void)quys_requestFial:(QuysAdBaseService *)service error:(NSError *)error
{
    
    
}

#pragma mark - Init
-(UIView *)adviceView
{
    if (_adviceView == nil) {
        _adviceView = [UIView new];
    }return _adviceView;
}


-(void)dealloc
{
    
}
@end
