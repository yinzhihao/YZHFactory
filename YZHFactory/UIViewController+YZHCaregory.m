//
//  UIViewController+YZHCaregory.m
//  YZHFactory
//
//  Created by 殷志豪 on 2020/8/6.
//  Copyright © 2020 yinzhihao. All rights reserved.
//

#import "UIViewController+YZHCaregory.h"

@implementation UIViewController (YZHCaregory)

+ (UIViewController *)yzh_getCurrentVC
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootVC = keyWindow.rootViewController;
    return [self getVisibleViewControllerFrom:rootVC];
}

+ (UIViewController *)getVisibleViewControllerFrom:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:((UINavigationController *)vc).visibleViewController];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:((UITabBarController *)vc).selectedViewController];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

@end
