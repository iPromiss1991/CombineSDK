//
//  AppDelegate.m
//  QuysAdvice
//
//  Created by quys on 2020/4/21.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "AppDelegate.h"
#import "QuysServiceListTableViewController.h"
#import <QuysAdviceSDK/QuysAdviceSDK.h>
@interface AppDelegate ()<QuysOpenScreenAdviceDelegate>
@property (nonatomic,strong)QuysOpenScreenAdvice *service ;
    
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor clearColor];
    QuysServiceListTableViewController *rootVC = [QuysServiceListTableViewController new];
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    
    
    QuysAdManager *manager = [QuysAdManager shareManager];
    [manager configWithAppID:@"A001001"];
    
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchIamge"];
    QuysOpenScreenAdvice *service = [[QuysOpenScreenAdvice alloc]
                                    initWithID:@"kp_ios_qys_test"
                                    key:@"206063F608B0A590F7ACCB7725207D37"
                                    launchScreenVC:viewController
                                    eventDelegate:self ];
    [service loadAdViewAndShow];
    self.service = service;

    return YES;
}


#pragma mark - UISceneSession lifecycle

 /// 开始发起广告请求
 /// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
 - (void)quys_requestStart:(QuysBaseAdvice*)advice{
     
 }

 /// 广告请求成功
 /// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
 - (void)quys_requestSuccess:(QuysBaseAdvice*)advice{
     
 }

 /// 广告请求失败
 /// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
 - (void)quys_requestFial:(QuysBaseAdvice*)advice error:(NSError*)error
{
    
}

 /// 广告曝光
 /// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
 - (void)quys_interstitialOnExposure:(QuysBaseAdvice*)advice{
     
 }

 /// 广告点击
 /// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
 - (void)quys_interstitialOnClickAdvice:(QuysBaseAdvice*)advice{
     
 }

 /// 广告关闭
 /// @param advice 广告请求服务基类（实际接收时转换为响应的类即可）
 - (void)quys_interstitialOnAdClose:(QuysBaseAdvice*)advice{
     
 }

- (void)quys_videoPlayEnd:(nonnull QuysBaseAdvice *)advice {

}

- (void)quys_videoPlaystart:(nonnull QuysBaseAdvice *)advice {

}



@end
