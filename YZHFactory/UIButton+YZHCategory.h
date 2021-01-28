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
 @param fontName 标题样式
 @param fontSize 标题大小
 @param normalColor 默认颜色
 @param selectedColor 选中颜色
 @return 按钮
 */
+ (instancetype)buttonWithTitleString:(NSString *)title
                             fontName:(nullable NSString *)fontName
                             fontSize:(CGFloat)fontSize
                          normalColor:(NSString *)normalColor
                        selectedColor:(NSString *)selectedColor;

@end

NS_ASSUME_NONNULL_END
