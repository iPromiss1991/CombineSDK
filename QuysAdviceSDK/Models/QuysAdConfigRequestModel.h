//
//  QuysAdConfigRequestModel.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



/// 广告配置请求model
@interface QuysAdConfigRequestModel : NSObject
@property (nonatomic , copy) NSString              * appName;//!<  App名称
@property (nonatomic , copy) NSString              * pkgName;//!<  bundleID

@property (nonatomic,strong) NSString *appId;


@end

NS_ASSUME_NONNULL_END
