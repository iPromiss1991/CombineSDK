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

@interface ViewController ()<QuysSplashAdviceDelegate,QuysIncentiveVideoAdviceDelegate>
@property (nonatomic,strong) QuysIncentiveVideoAdvice *advice;

@property (nonatomic,strong) UIView  *adView;
@property (nonatomic,assign) BOOL hidenAdvice;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"随机标题：%d",arc4random()];
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
    // Do any additional setup after loading the view.
//    QuysBannerAdvice *banner = [[QuysBannerAdvice alloc]initWithID:@"ziyanapp_banner" key:@"DF6CB421D36AE5B518700B40A77105A7" cgRect:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width , 200) eventDelegate:self parentView:self.view viewController:self];
//    self.banner = banner;
//    [self.banner performSelector:@selector(loadAdViewNow)];
//    QuysIncentiveVideoAdvice *advice = [[QuysIncentiveVideoAdvice alloc]initWithID:@"jlAdziyanapp"
//            key:@"1262DF2885ACB4EEC8FF0486502E7A6D"
//    eventDelegate:self  ];
//    self.advice = advice;
//    [(QuysIncentiveVideoAdvice*)self.advice loadAdViewAndShow];
    
    
}

- (void)updateViewConstraints
{
    
    
    [super updateViewConstraints];
}
//
//-(void)quys_requestStart:(QuysBaseAdvice *)advice
//{
//    NSLog(@"%s",__FUNCTION__);
//}
//
//- (void)quys_requestSuccess:(QuysBaseAdvice *)advice
//{
//    if ([self.advice isKindOfClass:[QuysIncentiveVideoAdvice class]])
//      {
//          self.adView = [self.advice valueForKey:@"adviceView"];
//
//      }else
//      {
//          [self.advice performSelector:@selector(showAdView)];
//          self.adView = [self.advice valueForKey:@"adviceView"];
//                
//      }    self.hidenAdvice = NO;
//
//    [self.view setNeedsUpdateConstraints];
//    [self.view updateConstraintsIfNeeded];
//}
//
//- (void)quys_interstitialOnAdClose:(QuysBaseAdvice *)advice
//{
//    self.hidenAdvice = YES;
//    
//    [self.view setNeedsUpdateConstraints];
//    [self.view updateConstraintsIfNeeded];
//}
//- (void)quys_requestFial:(QuysBaseAdvice *)advice error:(NSError *)error
//{
//    
//}
//
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesEnded:touches withEvent:event];
//    
////    QuysIncentiveVideoAdvice *advice = [[QuysIncentiveVideoAdvice alloc]initWithID:@"jlAdziyanapp"
////            key:@"1262DF2885ACB4EEC8FF0486502E7A6D"
////    eventDelegate:self  ];
////    self.advice = advice;
////    [(QuysIncentiveVideoAdvice*)self.advice loadAdViewAndShow];
//    
//    
//    
////    [self.banner performSelector:@selector(loadAdViewNow)];
////    self.hidenAdvice = NO;
////    if (self.adView.superview == nil)
////    {
////        [self.view addSubview:self.adView];
////    }
//    
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]])
//    {
//         
//        
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mqq://"]];
//        
//        
//    };
//
//    [self.view setNeedsUpdateConstraints];
//    [self.view updateConstraintsIfNeeded];
//
//}
//


@end

