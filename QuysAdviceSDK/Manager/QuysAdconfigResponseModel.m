




//
//  QuysAdconfigModel.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysAdconfigResponseModel.h"

@implementation QuysAdconfigResponseModelDataItemAdvice



@end


@implementation QuysAdconfigResponseModelDataItem  

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{

    return @{@"info" : [QuysAdconfigResponseModelDataItemAdvice class]};

}

@end



@implementation QuysAdconfigResponseModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{

    return @{@"data" : [QuysAdconfigResponseModelDataItem class]};

}

@end
