//
//  QuysBaseRequestApi.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysBaseRequestApi.h"
//#import <YTKNetwork/YTKNetwork.h>//YTKBaseRequest

@implementation QuysBaseRequestApi


-(NSTimeInterval)requestTimeoutInterval
{
    return 2;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}


@end
