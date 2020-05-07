//
//  UIImage+transform.h
//  QuysAdviceSDK
//
//  Created by quys on 2020/5/7.
//  Copyright © 2020 Quys. All rights reserved.
//

 


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (transform)

/// 使用该方法不会模糊，根据屏幕密度计算
/// @param view 待转化的View
+ (UIImage *)convertViewToImage:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
