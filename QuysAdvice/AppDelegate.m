//
//  AppDelegate.m
//  QuysAdvice
//
//  Created by quys on 2020/4/21.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "AppDelegate.h"
#import "QuysServiceListTableViewController.h"
#import "ViewController.h"
#import <QuysAdviceSDK/QuysAdviceSDK.h>
@interface AppDelegate ()<QuysOpenScreenAdviceDelegate>
@property (nonatomic,strong)QuysOpenScreenAdvice *service ;
    
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor clearColor];
    ViewController *rootVC = [ViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    
    ViewController *rootVC1 = [ViewController new];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:rootVC1];

    UITabBarController *tabBarVC = [[UITabBarController alloc]init] ;
    tabBarVC.viewControllers = @[nav,nav1];
    self.window.rootViewController = tabBarVC;
    
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

 -(void)quys_requestStart:(QuysBaseAdvice *)service
{
    
}

-(void)quys_requestSuccess:(QuysBaseAdvice *)service
{
    
}

-(void)quys_requestFial:(QuysBaseAdvice *)service error:(NSError *)error
{
    
}

- (void)quys_videoPlayEnd:(nonnull QuysBaseAdvice *)service {
     
}

- (void)quys_videoPlaystart:(nonnull QuysBaseAdvice *)service {
     
}

@end
