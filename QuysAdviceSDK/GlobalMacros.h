//
//  GlobalMacros.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/28.
//  Copyright © 2020 Quys. All rights reserved.
//

#ifndef GlobalMacros_h
#define GlobalMacros_h

#pragma mark -自定义Log
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


/*
 //广告商(快手、穿山甲、旺脉、优量汇)
 channelName= ="qys_sdk";//默认用自家广告
 channelName= ="ks_sdk";//快手
 channelName= ="csj_sdk";//穿山甲
 channelName= ="wm_sdk";//旺脉
 channelName= ="ylh_sdk";//优量汇
 channelName= ="baidu_sdk";//百青藤
 */
#define k_qys_sdk @"qys_sdk"
#define K_ks_sdk @"ks_sdk"
#define k_csj_sdk @"csj_sdk"

#define k_wm_sdk @"wm_sdk"
#define k_ylh_sdk @"ylh_sdk"
#define k_baidu_sdk @"baidu_sdk"





#endif /* GlobalMacros_h */
