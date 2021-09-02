//
//  UIView+YZHCategory.m
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/25.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UIView+YZHCategory.h"

@implementation UIView (YZHCategory)

- (CGFloat)yzh_x {
    return self.frame.origin.x;
}
- (void)setYzh_x:(CGFloat)yzh_x {
    CGRect frame = self.frame;
    frame.origin.x = yzh_x;
    self.frame = frame;
}
- (CGFloat)yzh_y {
    return self.frame.origin.y;
}
- (void)setYzh_y:(CGFloat)yzh_y {
    CGRect frame = self.frame;
    frame.origin.y = yzh_y;
    self.frame = frame;
}
- (CGFloat)yzh_width {
    return self.frame.size.width;
}
- (void)setYzh_width:(CGFloat)yzh_width {
    CGRect frame = self.frame;
    frame.size.width = yzh_width;
    self.frame = frame;
}
- (CGFloat)yzh_height {
    return self.frame.size.height;
}
- (void)setYzh_height:(CGFloat)yzh_height {
    CGRect frame = self.frame;
    frame.size.height = yzh_height;
    self.frame = frame;
}
- (CGFloat)yzh_centerX {
    return self.yzh_x + self.yzh_width / 2;
}
- (void)setYzh_centerX:(CGFloat)yzh_centerX {
    self.yzh_x = yzh_centerX - self.yzh_width / 2;
}
- (CGFloat)yzh_centerY {
    return self.yzh_y + self.yzh_height / 2;
}
- (void)setYzh_centerY:(CGFloat)yzh_centerY {
    self.yzh_y = yzh_centerY - self.yzh_width / 2;
}

//截图
- (UIImage *)yzh_captureImage {
    CGRect rect = self.bounds;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
