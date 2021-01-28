//
//  UIButton+YZHCategory.m
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/25.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UIButton+YZHCategory.h"
#import "UIColor+YZHCategory.h"

@implementation UIButton (YZHCategory)

+ (instancetype)buttonWithTitleString:(NSString *)title
                             fontName:(nullable NSString *)fontName
                             fontSize:(CGFloat)fontSize
                          normalColor:(NSString *)normalColor
                        selectedColor:(NSString *)selectedColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:normalColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:selectedColor] forState:UIControlStateSelected];
    
    if (fontName) {
        [button.titleLabel setFont:[UIFont fontWithName:fontName size:fontSize]];
    } else {
        [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    }
    [button sizeToFit];
    
    return button;
}

@end
