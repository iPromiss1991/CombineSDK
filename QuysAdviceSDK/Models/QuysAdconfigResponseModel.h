//
//  QuysAdconfigModel.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 广告类型：1:开屏广告，2:插屏广告，3：信息流广告，4：banner广告，5：视频广告
 */
typedef NS_ENUM(NSInteger) {
    QuysConfigAdviceTypeOpenScreen = 1,
    QuysConfigAdviceTypeSplash,
    QuysConfigAdviceTypeInformationFlow,
    QuysConfigAdviceTypeBanner,
    QuysConfigAdviceTypeVideo,
}QuysConfigAdviceType;

NS_ASSUME_NONNULL_BEGIN
@interface QuysAdconfigResponseModelDataItemAdviceInfo : NSObject
@property (nonatomic , assign) QuysConfigAdviceType              type;
@property (nonatomic , copy) NSString              * adId;
@property (nonatomic , copy) NSString              * qysId;
@property (nonatomic , assign) NSInteger              weight;
#warning 自定义：请求广告字段
@property (nonatomic , copy) NSString              * appId;
@property (nonatomic , copy) NSString              * channelName;


@end

@interface QuysAdconfigResponseModelDataItemAdvice : NSObject

@property (nonatomic , copy) NSString              * channelName;
@property (nonatomic , copy) NSString              * appId;
@property (nonatomic , strong) NSArray <QuysAdconfigResponseModelDataItemAdviceInfo *>              * info;
@end



@interface QuysAdconfigResponseModelDataAdvice : NSObject
@property (nonatomic , copy) NSString              * packageName;
@property (nonatomic , strong) NSArray <QuysAdconfigResponseModelDataItemAdvice *>              * configs;

@end




/// 广告配置响应model
@interface QuysAdconfigResponseModel : NSObject<NSCoding,NSCopying>
@property (nonatomic , copy) NSString              * msg;
@property (nonatomic , strong) QuysAdconfigResponseModelDataAdvice              * data;
@property (nonatomic , assign) NSInteger              code;

@end

NS_ASSUME_NONNULL_END
