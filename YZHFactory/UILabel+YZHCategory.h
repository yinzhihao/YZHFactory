//
//  UILabel+YZHCategory.h
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (YZHCategory)

/**
 快速创建Label

 @param text 标题
 @param textAlignment 对齐
 @param numberOfLines 行数
 @param font 字体大小
 @param color 字体颜色
 @return Label
 */
+ (instancetype)yzh_labelWithText:(NSString *)text
                    textAlignment:(NSTextAlignment)textAlignment
                    numberOfLines:(NSInteger)numberOfLines
                             font:(nullable UIFont *)font
                            color:(nullable UIColor *)color;

@end

NS_ASSUME_NONNULL_END
