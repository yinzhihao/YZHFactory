//
//  UILabel+YZHCategory.m
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UILabel+YZHCategory.h"

@implementation UILabel (YZHCategory)

+ (instancetype)yzh_labelWithText:(NSString *)text
                    textAlignment:(NSTextAlignment)textAlignment
                    numberOfLines:(NSInteger)numberOfLines
                             font:(nullable UIFont *)font
                            color:(nullable UIColor *)color
{
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    if(font){
        label.font = font;
    }
    if (color) {
        label.textColor = color;
    }
    return label;
}

@end
