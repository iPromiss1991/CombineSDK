//
//  QuysUploadApiTaskManager.h
//  quysAdvice
//
//  Created by quys on 2019/12/16.
//  Copyright © 2019 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuysReportRequestApi.h"
NS_ASSUME_NONNULL_BEGIN
///上报任务管理单例
@interface QuysReportApiTaskManager : NSObject
+ (instancetype)shareManager;

- (void)addUploadApis:(NSArray<QuysBaseRequestApi*> *)arrApi;

- (void)buildAndAddRequestModel:(QuysAdconfigResponseModelDataItemAdviceInfo *)adviceInfo eventType:(QuysUploadEventType)eventType;
@end

NS_ASSUME_NONNULL_END
