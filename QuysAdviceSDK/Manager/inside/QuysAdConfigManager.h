//
//  QuysAdConfigManager.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuysAdconfigResponseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QuysAdConfigManager : NSObject

/*
 1、当前调用接口时:根据广告类型以及权重 计算出  提供广告的上游SDK厂商
 
 */
@property (nonatomic,strong) QuysAdconfigResponseModel *adConfigModel;



+ (instancetype)shareManager;




- (void)configWithAppID:(NSString*)appid;


//根据 “广告类型” 获取 “广告”
- (QuysAdconfigResponseModelDataItemAdviceInfo*)getAdviceByType:(QuysConfigAdviceType)adviceType;


@end

NS_ASSUME_NONNULL_END
