//
//  QuysReportRequestApi.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/5/11.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysBaseRequestApi.h"
#import "QuysAdUploadRequestModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QuysReportRequestApi : QuysBaseRequestApi
@property (nonatomic,strong) QuysAdUploadRequestModel *reportModel;

@end

NS_ASSUME_NONNULL_END
