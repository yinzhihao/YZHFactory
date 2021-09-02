//
//  UINavigationController+YZHCategory.h
//  YZHFactory
//
//  Created by NO NAME on 2021/9/1.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YZHNavigationBarStyle) {
    YZHNavigationBarStyleLightContent,
    YZHNavigationBarStyleDarkContent,
};

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (YZHCategory)

/**
 返回到指定的控制器

 @param vcClass 指定控制器的类
 */
- (void)yzh_popToVCWithClass:(Class)vcClass;

/**
 设置导航条

 @param style 样式
 @param titleColor 标题颜色
 @param barTintColor 导航条颜色
 @param tintColor 左右图标颜色
 @param shadowImage 阴影图片
 */
- (void)yzh_setNavigationBarStyle:(YZHNavigationBarStyle)style
                       titleColer:(nullable UIColor *)titleColor
                     barTintColor:(nullable UIColor *)barTintColor
                        tintColor:(nullable UIColor *)tintColor
                      shadowImage:(nullable UIImage *)shadowImage;

@end

NS_ASSUME_NONNULL_END
