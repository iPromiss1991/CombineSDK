//
//  ManagerMacros.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/4/28.
//  Copyright © 2020 Quys. All rights reserved.
//

#ifndef ManagerMacros_h
#define ManagerMacros_h

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#define kManagerConfigAdviceModelPath [kPathDocument stringByAppendingPathComponent:@"ConfigAdviceModel"]

#endif /* ManagerMacros_h */
