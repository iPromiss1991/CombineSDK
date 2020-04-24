//
//  QuysAdConfigManager.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysAdConfigManager : NSObject

/*
 1、当前调用接口时:根据广告类型以及权重 计算出  提供广告的上游SDK厂商
 
 */


+ (instancetype)shareManager;

/// 添加广告
/// @param businessKey 广告Key
/// @param businessID 广告ID
- (void)addAdviceKey:(NSString*)businessKey adviceID:(NSString*)businessID ;


- (void)syncConfig;

@end

NS_ASSUME_NONNULL_END
