//
//  UIButton+YZHCategory.m
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/25.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UIButton+YZHCategory.h"

@implementation UIButton (YZHCategory)

+ (instancetype)yzh_buttonWithTitle:(NSString *)title
                               font:(nullable UIFont *)font
                        normalColor:(nullable UIColor *)normalColor
                    backgroundColor:(nullable UIColor *)backgroundColor
                              image:(nullable UIImage *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    if (font) {
        [button.titleLabel setFont:font];
    }
    if (normalColor) {
        [button setTitleColor:normalColor forState:UIControlStateNormal];
    }
    if (backgroundColor) {
        button.backgroundColor = backgroundColor;
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    
    return button;
}

@end
