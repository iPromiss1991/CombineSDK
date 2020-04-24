//
//  NSDate+format.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

 

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Quys_Format)
/// 获取当前时间戳 （以毫秒为单位）
+(NSString *)quys_getNowTimeTimestamp;


/// 获取当前时间戳 （以毫秒为单位）
+(NSString *)quys_getNowTimeSecond;
@end

NS_ASSUME_NONNULL_END
