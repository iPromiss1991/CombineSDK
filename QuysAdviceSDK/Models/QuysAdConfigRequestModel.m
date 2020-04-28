//
//  QuysAdConfigRequestModel.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysAdConfigRequestModel.h"



@implementation QuysAdConfigRequestModel


- (NSString *)appName
{
    if (_appName == nil)
    {
        UIDevice *device = [UIDevice new];
        _appName = [device quys_getAppName];
    }return _appName;
}

- (NSString *)pkgName
{
    if (_pkgName == nil) {
        UIDevice *device = [UIDevice new];
        _pkgName = [device quys_getBundleID];
    }return _pkgName;
}



@end
