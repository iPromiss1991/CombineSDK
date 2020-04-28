//
//  ViewController.m
//  QuysAdvice
//
//  Created by quys on 2020/4/21.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "ViewController.h"
#import <QuysAdviceSDK/QuysAdviceSDK.h>
#import <Masonry.h>

@interface ViewController ()<QuysSplashAdviceDelegate>
@property (nonatomic,strong) QuysBannerAdvice *banner;

@property (nonatomic,strong) UIView  *adView;
@property (nonatomic,assign) BOOL hidenAdvice;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    // Do any additional setup after loading the view.
//    QuysBannerAdvice *banner = [[QuysBannerAdvice alloc]initWithID:@"ziyanapp_banner" key:@"DF6CB421D36AE5B518700B40A77105A7" cgRect:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width , 200) eventDelegate:self parentView:self.view viewController:self];
//    self.banner = banner;
//    [self.banner performSelector:@selector(loadAdViewNow)];

    
}

- (void)updateViewConstraints
{
    
    [self.adView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(200);
        make.left.right.mas_equalTo(self.view);
        if (self.hidenAdvice)
        {
            make.height.mas_equalTo(0);

        }else
        {
            make.height.mas_equalTo(200);
        }
            }];
    
    [super updateViewConstraints];
}

-(void)quys_requestStart:(QuysBaseAdvice *)service
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)quys_requestSuccess:(QuysBaseAdvice *)service
{
    self.adView =  [self.banner showAdView];
    self.hidenAdvice = NO;

    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

- (void)quys_interstitialOnAdClose:(QuysBaseAdvice *)service
{
    self.hidenAdvice = YES;
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}
- (void)quys_requestFial:(QuysBaseAdvice *)service error:(NSError *)error
{
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    QuysBannerAdvice *banner = [[QuysBannerAdvice alloc]initWithID:@"ziyanapp_banner" key:@"DF6CB421D36AE5B518700B40A77105A7" cgRect:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width , 200) eventDelegate:self parentView:self.view viewController:self];
    self.banner = banner;
    [self.banner performSelector:@selector(loadAdViewNow)];
    
    
    
//    [self.banner performSelector:@selector(loadAdViewNow)];
//    self.hidenAdvice = NO;
//    if (self.adView.superview == nil)
//    {
//        [self.view addSubview:self.adView];
//    }
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];

}

@end

