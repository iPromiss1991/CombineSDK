//
//  QuysReportApiTaskManager.m
//  quysAdvice
//
//  Created by quys on 2019/12/16.
//  Copyright © 2019 Quys. All rights reserved.
//

#import "QuysReportApiTaskManager.h"

static const NSInteger AsyncThreadCount = 5;//线程同步最大并发数
@interface QuysReportApiTaskManager()

@property (nonatomic,strong) NSMutableArray <QuysBaseRequestApi*> *arrApis;

@property (nonatomic,strong) dispatch_semaphore_t  semaphore;
@property (nonatomic,strong) NSConditionLock *conditionLock;

@property (nonatomic,strong) dispatch_queue_t productQueue;
@property (nonatomic,strong) dispatch_queue_t confumeQueue;


@end


@implementation QuysReportApiTaskManager


+ (instancetype)shareManager
{
    static QuysReportApiTaskManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
        manager.semaphore = dispatch_semaphore_create(AsyncThreadCount);
        manager.productQueue = dispatch_queue_create("com.quys.adviceP", DISPATCH_QUEUE_CONCURRENT);
        manager.confumeQueue = dispatch_queue_create("com.quys.adviceC", DISPATCH_QUEUE_CONCURRENT);
        manager.conditionLock = [[NSConditionLock alloc]initWithCondition:0];
    });
    return manager;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [QuysReportApiTaskManager shareManager] ;
}
-(id) copyWithZone:(struct _NSZone *)zone
{
    return [QuysReportApiTaskManager shareManager] ;
}

- (void)addUploadApis:(NSArray<QuysBaseRequestApi*> *)arrApi
{
    kWeakSelf(self);
         dispatch_async(weakself.productQueue, ^{
             {
                 [weakself.conditionLock lock];
                 [weakself.arrApis addObjectsFromArray:arrApi];
                 [weakself.conditionLock unlockWithCondition:1];
             }
         });
    static dispatch_once_t onceToken1;
    dispatch_once(&onceToken1, ^{
            [weakself confumeTasks];
    });
}

- (void)confumeTasks
{
    kWeakSelf(self);
       dispatch_async(self.confumeQueue, ^{
           while (self.arrApis.count > 0)
           {
               [self.conditionLock lockWhenCondition:1];
               QuysBaseRequestApi *api = weakself.arrApis[0];
               [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                   NSLog(@"上报成功:%@   %@\n response:\n%@\n",request.baseUrl,request.requestUrl,request.responseObject);
                   [weakself.arrApis removeObject:api];
                   [weakself.conditionLock unlockWithCondition:2];

               } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                   [weakself.arrApis removeObject:api];
                   NSLog(@"上报失败:%@   %@\n",request.baseUrl,request.requestUrl);
                   [weakself.conditionLock unlockWithCondition:2];
               }];
               
               
           }
       });
}


- (void)buildAndAddRequestModel:(QuysAdconfigResponseModelDataItemAdviceInfo *)adviceInfo eventType:(QuysUploadEventType)eventType
{
    if (adviceInfo)
    {
         QuysReportRequestApi *api = [QuysReportRequestApi new];
         QuysAdUploadRequestModel* reportModel = [QuysAdUploadRequestModel new];
         reportModel.channel = adviceInfo.channelName;
         reportModel.adType = (NSInteger)adviceInfo.type;
         reportModel.type = eventType;
         reportModel.ssp = adviceInfo.qysId;
         api.reportModel = reportModel;

         /*@property (nonatomic,copy) NSString *channel;//!<  广告商
         @property (nonatomic,assign) QuysUploadAdviceType adType;//!<  广告类型
         @property (nonatomic,assign) QuysUploadEventType type;//!<  事件类型

         @property (nonatomic,copy) NSString *appName;//!<  app名字
         @property (nonatomic,copy) NSString *pkgName;//!<  包名
         @property (nonatomic,copy) NSString *ssp;//!<  sdk配置信息接口返回字段qysId
          */
         [self addUploadApis:@[api]];
    }
}

-(NSMutableArray<QuysBaseRequestApi *> *)arrApis
{
    if (_arrApis ==nil) {
        _arrApis = [NSMutableArray new];
    }return _arrApis;
}

@end
