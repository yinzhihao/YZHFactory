//
//  UIButton+YZHCategory.h
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/25.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YZHCategory)

/**
 快速创建按钮

 @param title 标题
 @param font 字体
 @param normalColor 默认颜色
 @param backgroundColor 背景颜色
 @param image 图片
 @return 按钮
 */
+ (instancetype)yzh_buttonWithTitle:(NSString *)title
                               font:(nullable UIFont *)font
                        normalColor:(nullable UIColor *)normalColor
                    backgroundColor:(nullable UIColor *)backgroundColor
                              image:(nullable UIImage *)image;

@end

NS_ASSUME_NONNULL_END
