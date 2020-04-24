
//
//  QuysAdConfigManager.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysAdConfigManager.h"
#import "QuysAdConfigRequestModel.h"
#import "QuysConfigRequestApi.h"
#import <quysAdvice/quysAdvice.h>


@interface QuysAdConfigManager()
@property (nonatomic,strong) NSMutableArray <QuysAdConfigRequestModelItem*> *adviceConfigArr;//!< 广告请求参数数组

@end


@implementation QuysAdConfigManager

+ (instancetype)shareManager
{
    static QuysAdConfigManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];

    });
    return manager;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [QuysAdConfigManager shareManager] ;
}
-(id) copyWithZone:(struct _NSZone *)zone
{
    return [QuysAdConfigManager shareManager] ;
}

#pragma mark - Method

- (void)addAdviceKey:(NSString *)businessKey adviceID:(NSString *)businessID
{
    QuysAdConfigRequestModelItem *model = [QuysAdConfigRequestModelItem new];
    model.strId = businessID;
    model.strKey = businessKey;
    [self.adviceConfigArr addObject:model];
}


- (void)syncConfig
{
    
    [[QuysAdviceManager shareManager] configSettings] ;//TODO:初始化

    
    QuysAdConfigRequestModel *model = [QuysAdConfigRequestModel new];
    model.info = self.adviceConfigArr;
    QuysConfigRequestApi *api = [QuysConfigRequestApi new];

    
}


@end
