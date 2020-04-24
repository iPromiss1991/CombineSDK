//
//  QuysAdConfigRequestModel.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysAdConfigRequestModel.h"


@implementation QuysAdConfigRequestModelItem

+ (NSDictionary *)modelCustomPropertyMapper
{
    return
    @{
        @"strId" : @"id"
    };
}


@end


@implementation QuysAdConfigRequestModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{

    return @{@"info" : [QuysAdConfigRequestModelItem class]};

}


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

-(NSString*)os
{
    if (_os == nil) {
        _os = @"2";
    }return _os;
}

-(NSString*)timestamp
{
    if (_timestamp == nil) {
         _timestamp = [NSDate quys_getNowTimeTimestamp] ;
    }return _timestamp;
}

@end
