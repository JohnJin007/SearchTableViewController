//
//  UIImage+Color.h
//  LoveDrive
//
//  Created by 范旭(平安科技保险创新平台部前端开发组) on 16/11/2.
//  Copyright © 2016年 彭健克. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+ (UIImage *)imageWithRenderNamed:(NSString *)name;
+ (UIImage *)imageWithColor:(UIColor *)color;
// 三角形
+ (UIImage *)imageTriangleWithColor:(UIColor *)color rect:(CGRect)rect point1:(CGPoint)point1 point2:(CGPoint)point2 point3:(CGPoint)point3;
#pragma mark --- 二维码生成
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize;
@end
