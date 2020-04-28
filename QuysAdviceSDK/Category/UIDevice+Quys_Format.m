//
//  UIDevice+Quys_Format.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "UIDevice+Quys_Format.h"

 

@implementation UIDevice (Quys_Format)

- (NSString *)quys_getAppName
{
    return  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]?[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

- (NSString*)quys_getBundleID
{
    return [[NSBundle mainBundle] bundleIdentifier];
}


@end
