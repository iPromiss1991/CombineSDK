//
//  NSDate+format.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "NSDate+Quys_Format.h"

 

@implementation NSDate (Quys_Format)
+(NSString *)quys_getNowTimeTimestamp
{

    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)([datenow timeIntervalSince1970]*1000)];//// *1000 是精确到毫秒，不乘就是精确到秒

    return timeSp;
}

+(NSString *)quys_getNowTimeSecond
{

    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)([datenow timeIntervalSince1970])];//秒

    return timeSp;
}
@end

