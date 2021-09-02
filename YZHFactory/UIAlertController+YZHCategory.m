//
//  UIAlertController+YZHCategory.m
//  YZHFactory
//
//  Created by NO NAME on 2021/8/25.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "UIAlertController+YZHCategory.h"

@implementation UIAlertController (YZHCategory)

+ (void)yzh_alertControllerWithVC:(UIViewController *)vc
                                           title:(NSString *)title
                                         message:(NSString *)message
                                  preferredStyle:(UIAlertControllerStyle)style
                                     cancelTitle:(NSString *)cancelTitle
                                     cancelBlock:(void(^)(UIAlertAction *action))cancelBlock
                                         okTitle:(NSString *)okTitle
                                         okBlock:(void(^)(UIAlertAction *action))okBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    if (cancelTitle != nil) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancelBlock];
        [alert addAction:cancelAction];
    }
    
    if (okTitle != nil) {
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:okBlock];
        [alert addAction:okAction];
    }
    
    [vc presentViewController:alert animated:YES completion:nil];
}

@end
