//
//  UIDevice+Quys_Format.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Quys_Format)

/// 获取app名称
- (NSString*)quys_getAppName;


/// 获取应用ID
- (NSString*)quys_getBundleID;

@end

NS_ASSUME_NONNULL_END
