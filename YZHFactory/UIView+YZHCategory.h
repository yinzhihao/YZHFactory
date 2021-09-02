//
//  UIView+YZHCategory.h
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/25.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YZHCategory)

@property (nonatomic, assign) CGFloat yzh_x;
@property (nonatomic, assign) CGFloat yzh_y;
@property (nonatomic, assign) CGFloat yzh_width;
@property (nonatomic, assign) CGFloat yzh_height;
@property (nonatomic, assign) CGFloat yzh_centerX;
@property (nonatomic, assign) CGFloat yzh_centerY;

#pragma mark - 截图

- (UIImage *)yzh_captureImage;

@end
