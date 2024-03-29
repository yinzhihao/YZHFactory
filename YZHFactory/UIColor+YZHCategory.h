//
//  UIColor+YZHCategory.h
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YZHCategory)

/**
 使用 16 进制数字创建颜色，格式 a/r/g/b，例如 0xFFFF0000 创建红色

 @param hex 16 进制无符号32位整数
 @return 颜色
 */
+ (instancetype)yzh_colorWithHex:(uint32_t)hex;

/**
 产生随机色

 @return 随机色
 */
+ (instancetype)yzh_arc4randomColor;


/**
 支持三种格式颜色字符串@"123456"  @"0x123456"  @"#123456"输入

 @param color 十六进制颜色字符串
 @param alpha 透明度
 @return Color
 */
+ (UIColor *)yzh_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 支持三种格式颜色字符串@"123456"  @"0x123456"  @"#123456"输入

 @param color 十六进制颜色字符串
 @return Color
 */
+ (UIColor *)yzh_colorWithHexString:(NSString *)color;

@end

NS_ASSUME_NONNULL_END
