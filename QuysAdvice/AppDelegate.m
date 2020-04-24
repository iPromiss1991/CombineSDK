//
//  AppDelegate.m
//  QuysAdvice
//
//  Created by quys on 2020/4/21.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "AppDelegate.h"
#import <QuysAdviceSDK/QuysAdviceSDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    QuysAdConfigManager *manager = [QuysAdConfigManager shareManager];
    [manager syncConfig];
    return YES;
}


#pragma mark - UISceneSession lifecycle

 

@end
