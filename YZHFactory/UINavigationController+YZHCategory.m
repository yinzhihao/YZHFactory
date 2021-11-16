//
//  UINavigationController+YZHCategory.m
//  YZHFactory
//
//  Created by NO NAME on 2021/9/1.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UINavigationController+YZHCategory.h"
#import "YZHDefine.h"
#import "UIImage+YZHCategory.h"

@implementation UINavigationController (YZHCategory)

- (void)yzh_popToVCWithClass:(Class)vcClass
{
    for (UIViewController *ctl in self.viewControllers) {
        if ([ctl isKindOfClass:vcClass]) {
            [self popToViewController:ctl animated:YES];
        }
    }
}

- (void)yzh_setNavigationBarStyle:(YZHNavigationBarStyle)style
                       titleColer:(nullable UIColor *)titleColor
                     barTintColor:(nullable UIColor *)barTintColor
                        tintColor:(nullable UIColor *)tintColor
                      shadowImage:(nullable UIImage *)shadowImage
{
    UIColor *_titleColor = nil;
    UIColor *_barTintColor = nil;
    UIColor *_tintColor = nil;
    UIImage *_shadowImage = nil;
    switch (style) {
        case YZHNavigationBarStyleLightContent:
        {
            UIColor *defaultTitleColor = RGB_COLOR(255, 255, 255);
            UIColor *defaultMainColor = RGB_COLOR(0, 0, 0);
            UIColor *defaultShadowColor = RGB_COLOR(232, 232, 232);
            _titleColor = titleColor?:defaultTitleColor;
            _barTintColor = barTintColor?:defaultMainColor;
            _tintColor = tintColor?:defaultTitleColor;
            _shadowImage = shadowImage?:[UIImage yzh_imageWithColor:defaultShadowColor size:CGSizeMake(SCREEN_WIDTH, 0.5)];
            break;
        }
        case YZHNavigationBarStyleDarkContent:
        {
            UIColor *defaultTitleColor = RGB_COLOR(0, 0, 0);
            UIColor *defaultMainColor = RGB_COLOR(255, 255, 255);
            UIColor *defaultShadowColor = RGB_COLOR(232, 232, 232);
            _titleColor = titleColor?:defaultTitleColor;
            _barTintColor = barTintColor?:defaultMainColor;
            _tintColor = tintColor?:defaultTitleColor;
            _shadowImage = shadowImage?:[UIImage yzh_imageWithColor:defaultShadowColor size:CGSizeMake(SCREEN_WIDTH, 0.5)];
            break;
        }
            
        default:
            break;
    }
    
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *navAppearance = [[UINavigationBarAppearance alloc] init];
        navAppearance.titleTextAttributes = @{NSForegroundColorAttributeName:_titleColor};
        navAppearance.backgroundColor = _barTintColor;
        navAppearance.shadowColor = UIColor.clearColor;
        self.navigationBar.standardAppearance = navAppearance;
        self.navigationBar.scrollEdgeAppearance = navAppearance;
        self.navigationBar.translucent = NO;
        self.navigationBar.tintColor = _tintColor;
    } else {
        // Fallback on earlier versions
        [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:_titleColor forKey:NSForegroundColorAttributeName]];
        [self.navigationBar setBarTintColor:_barTintColor];
        [self.navigationBar setTintColor:_tintColor];
        [self.navigationBar setShadowImage:_shadowImage];
        self.navigationBar.translucent = NO;
    }
}

@end
