//
//  QuysAdUploadRequestModel.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/28.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 //广告商(快手、穿山甲、旺脉、优量汇)
 channelName= ="qys_sdk";//默认用自家广告
 channelName= ="ks_sdk";//快手
 channelName= ="csj_sdk";//穿山甲
 channelName= ="wm_sdk";//旺脉
 channelName= ="ylh_sdk";//优量汇
 channelName= ="baidu_sdk";//百青藤
 */
typedef NS_ENUM(NSInteger) {
    QuysUploadAdviceTypeOpenScreen = 1,
    QuysUploadAdviceTypeSplash,
    QuysUploadAdviceTypeInformationFlow,
    QuysUploadAdviceTypeBanner,
    QuysUploadAdviceTypeVideo,
}QuysUploadAdviceType;//广告类型

typedef NS_ENUM(NSInteger) {
    QuysUploadEventType_Request_Success = 1,//!<  请求成功
    QuysUploadEventType_Request_Fail = 2,//!<  请求失败
    QuysUploadEventType_Expourse = 13,//!<  曝光
    QuysUploadEventType_Click = 3,//!<  点击
    QuysUploadEventType_Close = 4,//!<  关闭
    QuysUploadEventType_Play_Start = 5,//!<  开始播放
    QuysUploadEventType_Play_End = 6,//!<  播放完成
    QuysUploadEventType_Play_Error = 7,//!<  播放出错
    QuysUploadEventType_Download_Start = 8,//!<  下载开始
    QuysUploadEventType_App_Open = 12,//!<  下载完成
    
    
}QuysUploadEventType;//广告类型



NS_ASSUME_NONNULL_BEGIN

@interface QuysAdUploadRequestModel : NSObject
@property (nonatomic,copy) NSString *channel;//!<  广告商
@property (nonatomic,assign) QuysUploadAdviceType adType;//!<  广告类型
@property (nonatomic,assign) QuysUploadEventType type;//!<  事件类型

@property (nonatomic,copy) NSString *appName;//!<  app名字
@property (nonatomic,copy) NSString *pkgName;//!<  包名
@property (nonatomic,copy) NSString *ssp;//!<  sdk配置信息接口返回字段qysId



@end

NS_ASSUME_NONNULL_END
