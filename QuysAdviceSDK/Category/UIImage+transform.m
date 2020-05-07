//
//  UIImage+transform.m
//  QuysAdviceSDK
//
//  Created by quys on 2020/5/7.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "UIImage+transform.h"

 

@implementation UIImage (transform)

//使用该方法不会模糊，根据屏幕密度计算
+ (UIImage *)convertViewToImage:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}
//{
//
//    UIImage *imageRet = [[UIImage alloc]init];
//    //UIGraphicsBeginImageContextWithOptions(区域大小, 是否是非透明的, 屏幕密度);
//    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
//    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    imageRet = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    return imageRet;
//
//}


@end
