//
//  QuysAdviceManager.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/28.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysAdManager.h"
#import "QuysAdConfigManager.h"

@implementation QuysAdManager

+ (instancetype)shareManager
{
    static QuysAdManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];

    });
    return manager;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [QuysAdManager shareManager] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [QuysAdManager shareManager] ;
}


#pragma mark - Method

- (void)configWithAppID:(NSString *)appid
{
    QuysAdConfigManager *manager = [QuysAdConfigManager shareManager];
    [manager configWithAppID:appid];
}


@end
