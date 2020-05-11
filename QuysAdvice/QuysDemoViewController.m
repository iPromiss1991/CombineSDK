//
//  QuysDemoViewController.m
//  quysDevDemo
//
//  Created by quys on 2020/1/7.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysDemoViewController.h"
#import <Masonry/Masonry.h>
#import <StoreKit/StoreKit.h>
 @interface QuysDemoViewController ()<NSURLSessionTaskDelegate,SKStoreProductViewControllerDelegate>
@property (nonatomic,strong)  id service;
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
            self.service = [[QuysBannerAdvice alloc ]initWithID:@"qystest_banner"
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
                                                               presentViewController:self];
        }
        
        if ([strService isEqualToString:@"插屏"])
        {
            self.service = [[QuysSplashAdvice alloc ]initWithID:@"quystest-cp"
                                                            key:@"8EB8AC0B397CA55C2D78DE88DF8587C2"
                                                  eventDelegate:self
                                                     presentViewController:self];
        }
    }
    
#endif
    if ([self.service isKindOfClass:[QuysBannerAdvice class]])
    {
        [self.service performSelector:@selector(loadAdViewAndShow)];
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
/*
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
 */

-(void)quys_InformationFlowRequestSuccess:(QuysInformationFlowAdvice *)advice
{
    [self showAdviceView];

}

- (void)quys_BannerRequestSuccess:(QuysBannerAdvice*)service
{
    
    [self showAdviceView];

}
- (void)quys_SplashRequestSuccess:(QuysSplashAdvice *)advice
{
    [self showAdviceView];
}


-(void)quys_IncentiveVideoRequestSuccess:(QuysIncentiveVideoAdvice *)advice
{

    [self.service performSelector:@selector(loadAdViewAndShow)];
    self.adviceView = [self.service valueForKey:@"adviceView"];

    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}


- (void)showAdviceView
{
    if ([self.service respondsToSelector:@selector(showAdView)])
    {
        [self.service performSelector:@selector(showAdView)];
    }
    self.adviceView = [self.service valueForKey:@"adviceView"];
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
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
            self.service = [[QuysIncentiveVideoAdvice alloc]initWithID:@"jlAdtest"
                                                                   key:@"1262DF2885ACB4EEC8FF0486502E7A6D"
                                                         eventDelegate:self presentViewController:self ];
        }
    }
//    [self requestByURLSession];
#endif
}


- (void)requestByURLSession
{
    NSURL *url = [NSURL URLWithString:@"http://suo.im/6dKUUu"];//http://suo.im/6dKUUu
    NSMutableURLRequest *quest = [NSMutableURLRequest requestWithURL:url];
    quest.HTTPMethod = @"GET";

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue currentQueue]];
    NSURLSessionDataTask *task = [urlSession dataTaskWithRequest:quest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                     {
                                         NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;

                                         NSLog(@"statusCode: %ld", urlResponse.statusCode);
                                         NSLog(@"%@", urlResponse.allHeaderFields);
        
        {
            NSString *appId = @"930368978";
            SKStoreProductViewController* storeProductVC =  [[SKStoreProductViewController alloc] init];
            storeProductVC.delegate = self;
            NSDictionary* dict = [NSDictionary dictionaryWithObject:appId forKey:SKStoreProductParameterITunesItemIdentifier];
            [storeProductVC loadProductWithParameters:dict completionBlock:^(BOOL result,NSError*error)
             {
                if(result)
                {
//                    [[self] presentViewController:storeProductVC animated:YES completion:nil];
  
                    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:storeProductVC animated:YES completion:nil];

                }
            }];
            
        }
        
                                     }];
    [task resume];
}

#pragma mark - NSURLSessionTaskDelegate
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task willPerformHTTPRedirection:(NSHTTPURLResponse *)response newRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLRequest * __nullable))completionHandler
{
    NSLog(@"statusCode: %ld", response.statusCode);
    NSDictionary *headers = response.allHeaderFields;
    NSLog(@"%@", headers);
    NSLog(@"redirect   url: %@", headers[@"Location"]); // 重定向的地址，如：http://www.jd.com
    NSLog(@"newRequest url: %@", [request URL]);        // 重定向的地址，如：http://www.jd.com
    NSLog(@"redirect response url: %@", [response URL]);// 触发重定向请求的地址，如：http://www.360buy.com
/*
 方式一：
 https://apps.apple.com/cn/app/中国银行手机银行/id399608199
 https://itunes.apple.com/us/app/yao-ba/id1062767832?l=zh&ls=1&mt=8
 2020-05-09 10:36:09.215039+0800 趣[10150:2916613] redirect   url: https://apps.apple.com/cn/app/id930368978?930368978
 2020-05-09 10:36:09.215395+0800 趣[10150:2916613] newRequest url: https://apps.apple.com/cn/app/id930368978?930368978
 2020-05-09 10:36:09.245687+0800 趣[10150:2916613] redirect response url: http://suo.im/6dKUUu
 
 
 方式二：
 itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=399608199
 */
    completionHandler(request);
//    completionHandler(nil);// 参数为nil，表示拦截（禁止）重定向
}


#pragma mark - Init

-(void)dealloc
{
    
}


@end
