//
//  QuysReportRequestApi.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/5/11.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysReportRequestApi.h"

@implementation QuysReportRequestApi
-(NSString *)requestUrl
{
    NSString *strRequestUrl ;

    #ifdef IsReleaseVersion
        
        strRequestUrl = @"http://adx.quyuansu.com/api/spread/census/record";

    #else
        
        strRequestUrl = @"";

    #endif

    NSLog(@"请求地址：\n%@\n",strRequestUrl);
    return strRequestUrl;
}

- (id)requestArgument
{
    NSLog(@"请求参数：\n%@\n",self.reportModel);
    return [self.reportModel yy_modelToJSONString];
    
    
}


- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}



@end
