//
//  QuysDemoViewController.m
//  quysDevDemo
//
//  Created by quys on 2020/1/7.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysDemoViewController.h"
#import <Masonry/Masonry.h>

@interface QuysDemoViewController ()
@property (nonatomic,strong) QuysBaseAdvice *service;
@property (nonatomic, strong) UIView *viewContain;//!< <#Explement #>
@property (nonatomic, strong) UIView *viewContainBottom;//!< <#Explement #>
@property (nonatomic, strong) UIView *adviceView;//!< <#Explement #>

@end

@implementation QuysDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    UIView *viewContain = [[UIView alloc]init];
    viewContain.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewContain];
    self.viewContain=  viewContain;
    
    UIView *viewContainBottom = [[UIView alloc]init];
    viewContainBottom.backgroundColor = [UIColor purpleColor];
    [self.viewContain addSubview:viewContainBottom];
    self.viewContainBottom =  viewContainBottom;
    NSString *strService = self.title;
    
    //TODO：正式环境测试数据( 在setting中设置  IsReleaseVersion)
    
#ifdef IsReleaseVersion
    {

         if ([strService isEqualToString:@"banner"])
            {
                self.service = [[QuysBannerAdvice alloc ]initWithID:@"banner_ios_qys_test"
                                                                   key:@"D0E8D293C79F627ABB15761662C65AB3"
                                                                cgRect:CGRectMake(0, 64,[UIScreen mainScreen].bounds.size.width , 100)
                                                                eventDelegate:self
                                                                viewController:self];
            }
            
            if ([strService isEqualToString:@"信息流"])
            {
                self.service =  [[QuysInformationFlowAdvice alloc ]initWithID:@"xxl_ios_qys_test"
                                                                           key:@"AA47EC3568A2B24ABEF4996A739A8291"
                                                                        cgRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)
                                                                 eventDelegate:self
                                                                   parentView:viewContain viewController:self];
            }
            
            if ([strService isEqualToString:@"插屏"])
            {
                self.service = [[QuysSplashAdvice alloc ]initWithID:@"cp_ios_qys_test"
                                                                   key:@"BA705F17304101A531E474CD8BBB5821"
                                                                cgRect:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width , 200)
                                                         eventDelegate:self
                                                            parentView:self.view];
            }
            
         
    }
# else
    {
        //
           if ([strService isEqualToString:@"banner"])
           {
               self.service = [[QuysBannerAdvice alloc ]initWithID:@"ziyanapp_banner"
                                                                  key:@"DF6CB421D36AE5B518700B40A77105A7"
                                                               cgRect:CGRectMake(0, 64,[UIScreen mainScreen].bounds.size.width , 100)
                                                        eventDelegate:self
                                                           viewController:self];
           }
           
           if ([strService isEqualToString:@"信息流"])
           {
               self.service =  [[QuysInformationFlowAdvice alloc ]initWithID:@"quystest-xx"
                                                                          key:@"3A6511273E535FA02C15F37D17D22A95"
                                                                       cgRect:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)
                                                                eventDelegate:self
                                                                   parentView:viewContain viewController:self];
           }
           
           if ([strService isEqualToString:@"插屏"])
           {
               self.service = [[QuysSplashAdvice alloc ]initWithID:@"ziyanapp_cp"
                                                                  key:@"8EB8AC0B397CA55C2D78DE88DF8587C2"
                                                               cgRect:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width , 200)
                                                        eventDelegate:self
                                                           parentView:viewContain];
           }
    }
   
#endif
    if ([self.service isKindOfClass:[QuysBannerAdvice class]])
    {
        [self.service performSelector:@selector( loadAdViewAndShow)];
    }else if ([self.service isKindOfClass:[QuysIncentiveVideoAdvice class]])
    {
        //激励视频
    }else 
    {
        [self.service performSelector:@selector(loadAdViewNow)];

    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)updateViewConstraints
{
    if (self.service) {
        
        if (![self.title  containsString:@"激励视频"])
        {
            [self.viewContain mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.view).mas_offset(200);
                make.left.right.mas_equalTo(self.view);
                make.bottom.mas_lessThanOrEqualTo(self.view);
                make.height.mas_greaterThanOrEqualTo(400);
            }];
            
            if ([self.title containsString:@"插屏"])
            {
                 
            }else
            {
                [self.adviceView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.viewContain).offset(20);
                    make.left.right.mas_equalTo(self.viewContain);
                }];
                
                [self.viewContainBottom mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.adviceView.mas_bottom).offset(10);
                    make.left.right.mas_equalTo(self.viewContain);
                    make.bottom.mas_equalTo(self.viewContain).offset(-10);
                    make.height.mas_equalTo(50);
                }];
            }
        }
    }
    
    [super updateViewConstraints];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    
}

- (void)quys_requestStart:(QuysBaseAdvice*)service
{
    
}

- (void)quys_requestSuccess:(QuysBaseAdvice*)service
{
 
        if ([self.service isKindOfClass:[QuysIncentiveVideoAdvice class]])
        {
            self.adviceView = [self.service valueForKey:@"adviceView"];
            [self.service performSelector:@selector(loadAdViewAndShow)];


        }else
        {
            if ([self.service respondsToSelector:@selector(showAdView)])
            {
                 [self.service performSelector:@selector(showAdView)];
            }
            self.adviceView = [self.service valueForKey:@"adviceView"];
                  
        }
        
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];

}
- (void)quys_requestFial:(QuysBaseAdvice*)advice error:(NSError*)error{
    
}

- (void)quys_interstitialOnExposure:(QuysBaseAdvice*)advice{
    
}
- (void)quys_interstitialOnClickAdvice:(QuysBaseAdvice *)advice
{
    
}
    

- (void)quys_interstitialOnAdClose:(QuysBaseAdvice*)advice{
    
}

//尾帧
- (void)quys_endViewInterstitialOnExposure:(QuysBaseAdvice*)advice{
    
}
- (void)quys_endViewInterstitialOnClickAdvice:(nonnull QuysBaseAdvice *)service
{
    
}


- (void)quys_endViewInterstitialOnAdClose:(QuysBaseAdvice*)advice{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
#ifdef IsReleaseVersion
    {
        if ([self.title containsString:@"激励视频"])
           {
               self.service = [[QuysIncentiveVideoAdvice alloc]initWithID:@"jl_qys_ios_test"
                                                                       key:@"52C4305558DA476616E2B5B02C9DD315"
                                                               eventDelegate:self  ];
           }
    }
#else
        {
             if ([self.title containsString:@"激励视频"])
               {
                   self.service = [[QuysIncentiveVideoAdvice alloc]initWithID:@"jlAdziyanapp"
                                                                           key:@"1262DF2885ACB4EEC8FF0486502E7A6D"
                                                                   eventDelegate:self presentViewController:self ];
               }
        }
    
#endif
}

#pragma mark - Init

-(void)dealloc
{
    
}


@end
