




//
//  QuysAdconfigModel.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysAdconfigResponseModel.h"

@implementation QuysAdconfigResponseModelDataItemAdviceInfo


-  (void)encodeWithCoder:(NSCoder *)coder
{
    return [ self yy_modelEncodeWithCoder:coder];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self =  [super init];
    return [self yy_modelInitWithCoder:coder];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [self yy_modelCopy];
}
@end


@implementation QuysAdconfigResponseModelDataItemAdvice

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{

    return @{@"info" : [QuysAdconfigResponseModelDataItemAdviceInfo class]};

}
-  (void)encodeWithCoder:(NSCoder *)coder
{
    return [ self yy_modelEncodeWithCoder:coder];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self =  [super init];
    return [self yy_modelInitWithCoder:coder];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [self yy_modelCopy];
}

@end


@implementation QuysAdconfigResponseModelDataAdvice

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{

    return @{@"configs" : [QuysAdconfigResponseModelDataItemAdvice class]};

}

-  (void)encodeWithCoder:(NSCoder *)coder
{
    return [ self yy_modelEncodeWithCoder:coder];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self =  [super init];
    return [self yy_modelInitWithCoder:coder];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [self yy_modelCopy];
}
@end



@implementation QuysAdconfigResponseModel



-  (void)encodeWithCoder:(NSCoder *)coder
{
    return [ self yy_modelEncodeWithCoder:coder];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self =  [super init];
    return [self yy_modelInitWithCoder:coder];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [self yy_modelCopy];
}
@end
