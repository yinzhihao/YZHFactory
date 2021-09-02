//
//  UIColor+YZHCategory.m
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UIColor+YZHCategory.h"

@implementation UIColor (YZHCategory)

+ (instancetype)yzh_colorWithHex:(uint32_t)hex {
    int red, green, blue, alpha;
    blue = hex & 0x000000FF;
    green = (hex & 0x0000FF00) >> 8;
    red = (hex & 0x00FF0000) >> 16;
    alpha = (hex & 0xFF000000) >> 24;
    
    return [UIColor colorWithRed:red/255.0f
                           green:green/255.0f
                            blue:blue/255.0f
                           alpha:alpha/255.0f];
}

+ (instancetype)yzh_arc4randomColor {
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0f
                           green:arc4random_uniform(256)/255.0f
                            blue:arc4random_uniform(256)/255.0f
                           alpha:1.0];
}

+ (instancetype)yzh_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"] ) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:alpha];
}

+ (instancetype)yzh_colorWithHexString:(NSString *)color {
    //默认alpha值为1
    return [self yzh_colorWithHexString:color alpha:1.0f];
}

@end
