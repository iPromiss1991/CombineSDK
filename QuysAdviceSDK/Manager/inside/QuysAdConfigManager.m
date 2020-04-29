
//
//  QuysAdConfigManager.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/24.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysAdConfigManager.h"
#import "QuysAdConfigRequestModel.h"
#import "QuysAdconfigResponseModel.h"

#import "QuysConfigRequestApi.h"
#import <quysAdvice.h>
#import "ManagerMacros.h"

@interface QuysAdConfigManager()
@property (nonatomic,strong)QuysAdconfigResponseModel *configModel ;

@end


@implementation QuysAdConfigManager

+ (instancetype)shareManager
{
    static QuysAdConfigManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];

    });
    return manager;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [QuysAdConfigManager shareManager] ;
}
-(id) copyWithZone:(struct _NSZone *)zone
{
    return [QuysAdConfigManager shareManager] ;
}

#pragma mark - Method

 

- (void)configWithAppID:(NSString*)appid
{
    //TODO：初始化第三方
    if (self.configModel )
    {
        [self.configModel.data.configs enumerateObjectsUsingBlock:^(QuysAdconfigResponseModelDataItemAdvice * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.channelName isEqualToString:k_qys_sdk])
            {
                [[QuysAdviceManager shareManager] configSettings];

            }
        }];
         
    }
    
    //获取或者更新配置信息
    __weak typeof (self)weakSelf = self;
    QuysConfigRequestApi *api = [QuysConfigRequestApi new];
    QuysAdConfigRequestModel *model = [QuysAdConfigRequestModel new];
    model.appId = appid;
    NSDictionary *dicJsonRequest = [model yy_modelToJSONObject];
    api.requestJsonDic = dicJsonRequest;
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        //保存
        QuysAdconfigResponseModel *model = [QuysAdconfigResponseModel  yy_modelWithDictionary:request.responseJSONObject];
        weakSelf.configModel = model;
        [weakSelf saveAdviceConfigModel:model path:kManagerConfigAdviceModelPath];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        //配置初始化失败！
        
    }];
    
    
}


- (QuysAdconfigResponseModelDataItemAdviceInfo*)getAdviceByType:(QuysConfigAdviceType)adviceType
{
    //:校验bundleID是否合规（校验 本地BundleID 和 下发的BundleID 是否一致）
    QuysAdconfigResponseModelDataItemAdviceInfo *adviceInfo = nil;
    UIDevice *device = [UIDevice new];
//    if ([self.configModel.data.packageName isEqualToString:[device quys_getBundleID]])
    {
          NSMutableArray *adviceInfoArr = [NSMutableArray new];
             [self.configModel.data.configs enumerateObjectsUsingBlock:^(QuysAdconfigResponseModelDataItemAdvice * _Nonnull advice, NSUInteger idxAdvice, BOOL * _Nonnull stopAdvice) {
                 //商户
                 
                 [advice.info enumerateObjectsUsingBlock:^(QuysAdconfigResponseModelDataItemAdviceInfo * _Nonnull adviceInfoItem, NSUInteger idxAdviceInfo, BOOL * _Nonnull stopAdviceInfo) {
                     //商户广告
                     if (adviceInfoItem.type == adviceType)
                     {
                         //添加字段
                         adviceInfoItem.appId = advice.appId;
                         adviceInfoItem.channelName = advice.channelName;
                         [adviceInfoArr addObject:adviceInfoItem];
                     }
                 }];
                 
             }];
             //根据权重获取广告
         #define Quys_Debug

         #ifdef Quys_Debug
             NSMutableArray *adviceInfoArrTest = [NSMutableArray new];
             [adviceInfoArr enumerateObjectsUsingBlock:^(QuysAdconfigResponseModelDataItemAdviceInfo *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                 if ([obj.channelName isEqualToString:k_qys_sdk])
                 {
                     [adviceInfoArrTest addObject:obj];
                 }
             }];
             adviceInfoArr = adviceInfoArrTest;
         #else
         #endif

             if (adviceInfoArr.count)
             {
                  adviceInfo = adviceInfoArr[arc4random()%adviceInfoArr.count];
             }
    }
   
    return adviceInfo;
}

#pragma mark - DataStore

- (BOOL)saveAdviceConfigModel:(QuysAdconfigResponseModel*)adModel path:(NSString*)filePath
{
    BOOL result = [NSKeyedArchiver archiveRootObject:adModel toFile:filePath];
    return result;
}

- (QuysAdconfigResponseModel*)getAdviceConfigModel:(NSString*)filePath
{
    QuysAdconfigResponseModel *model   = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",model);
    return model;
}





#pragma mark - Init

- (QuysAdconfigResponseModel *)configModel
{
    if (_configModel == nil)
    {
        _configModel  = [self getAdviceConfigModel:kManagerConfigAdviceModelPath];
    }
    return _configModel;
}


@end
