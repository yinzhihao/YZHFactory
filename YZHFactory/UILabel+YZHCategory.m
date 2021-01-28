//
//  UILabel+YZHCategory.m
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UILabel+YZHCategory.h"
#import "UIColor+YZHCategory.h"

@implementation UILabel (YZHCategory)

+ (instancetype)labelWithText:(NSString *)text fontName:(nullable NSString *)fontName fontSize:(CGFloat)fontSize colorString:(NSString *)colorString {
    UILabel *label = [[self alloc] init];
    
    label.text = text;
    if(fontName){
        label.font = [UIFont fontWithName:fontName size:fontSize];
    }else{
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    label.textColor = [UIColor colorWithHexString:colorString];
    label.numberOfLines = 0;
    
    return label;
}

@end
