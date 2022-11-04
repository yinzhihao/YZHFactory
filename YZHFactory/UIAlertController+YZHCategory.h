//
//  UIAlertController+YZHCategory.h
//  YZHFactory
//
//  Created by NO NAME on 2021/8/25.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (YZHCategory)

+ (void)yzh_alertControllerWithVC:(UIViewController *)vc
                            title:(NSString *)title
                          message:(NSString *)message
                   preferredStyle:(UIAlertControllerStyle)style
                      cancelTitle:(nullable NSString *)cancelTitle
                      cancelBlock:(nullable void(^)(UIAlertAction *action))cancelBlock
                          okTitle:(nullable NSString *)okTitle
                          okBlock:(nullable void(^)(UIAlertAction *action))okBlock;

@end

NS_ASSUME_NONNULL_END
