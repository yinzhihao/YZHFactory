//
//  UIImage+YZHCategory.m
//  YZHFactory
//
//  Created by NO NAME on 2021/2/19.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UIImage+YZHCategory.h"

@implementation UIImage (YZHCategory)

+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
