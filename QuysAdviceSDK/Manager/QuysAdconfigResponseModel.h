//
//  QuysAdconfigModel.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface QuysAdconfigResponseModelDataItemAdvice : NSObject
@property (nonatomic , assign) NSInteger              type;
@property (nonatomic , copy) NSString              * adId;
@property (nonatomic , copy) NSString              * qysId;
@property (nonatomic , assign) NSInteger              weight;

@end


@interface QuysAdconfigResponseModelDataItem : NSObject
@property (nonatomic , copy) NSString              * channelName;
@property (nonatomic , copy) NSString              * appId;
@property (nonatomic , copy) NSString              * packageName;
@property (nonatomic , strong) NSArray <QuysAdconfigResponseModelDataItemAdvice *>              * info;

@end




/// 广告配置响应model
@interface QuysAdconfigResponseModel : NSObject
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , strong) NSArray <QuysAdconfigResponseModelDataItem *>              * data;
@property (nonatomic , assign) NSInteger              code;

@end

NS_ASSUME_NONNULL_END
