//
//  UIImage+YZHCategory.h
//  YZHFactory
//
//  Created by NO NAME on 2021/2/19.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YZHCategory)

/* color转成image
 *
 */
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
