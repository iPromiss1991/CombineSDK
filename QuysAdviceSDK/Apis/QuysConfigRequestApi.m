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
    NSString *strRequestUrl ;
#ifdef IsReleaseVersion
    
    strRequestUrl = @"http://adx.quyuansu.com/api/spread/sdk/config";

#else
    
    strRequestUrl = @"http://192.168.1.12/advert/sdkConfig.php";

#endif
    NSLog(@"请求地址：\n%@\n",strRequestUrl);
    return strRequestUrl;
}

- (id)requestArgument
{    
    NSLog(@"请求参数：\n%@\n",self.requestJsonDic);
    return self.requestJsonDic;
    
    
}

-(YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}

@end
