//
//  QuysAdConfigRequestModel.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysAdConfigRequestModelItem : NSObject
@property (nonatomic , copy) NSString              * strId;//!<  QuysAdviceID
@property (nonatomic , copy) NSString              * strKey;

@end


/// 广告配置请求model
@interface QuysAdConfigRequestModel : NSObject
@property (nonatomic , copy) NSString              * appName;//!<  App名称
@property (nonatomic , copy) NSString              * pkgName;//!<  bundleID
@property (nonatomic , copy) NSString             * os;//!<  系统：Android：1：         iOS：2
@property (nonatomic , copy) NSString              *timestamp;
@property (nonatomic , strong) NSArray <QuysAdConfigRequestModelItem *>              * info;
@end

NS_ASSUME_NONNULL_END
