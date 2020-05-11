//
//  QuysAdUploadRequestModel.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/28.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysAdUploadRequestModel.h"

@implementation QuysAdUploadRequestModel
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
