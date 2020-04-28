//
//  QuysAdviceManager.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/28.
//  Copyright © 2020 Quys. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuysAdManager : NSObject

+ (instancetype)shareManager;

- (void)configWithAppID:(NSString*)appid;

@end

NS_ASSUME_NONNULL_END
