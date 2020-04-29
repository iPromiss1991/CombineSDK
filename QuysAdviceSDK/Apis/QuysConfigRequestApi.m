//
//  QuysConfigRequestApi.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysConfigRequestApi.h"

@implementation QuysConfigRequestApi

-(NSString *)requestUrl
{
//#define Quys_Debug
    
#ifdef Quys_Debug
    
    return @"http://192.168.1.11/advert/sdkConfig.php";

#else
    
    return @"http://adx.quyuansu.com/api/spread/sdk/config";

#endif
    
}

- (id)requestArgument
{
//    return @{@"appId":@"A001001"};
    
    NSLog(@"请求参数：\n%@\n",self.requestJsonDic);
    return self.requestJsonDic;
    
    
}

-(YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}

@end
