//
//  UIView+YZHCategory.h
//  YZHFactory
//
//  Created by 殷志豪 on 2021/1/25.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YZHCategory)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

#pragma mark - 截图
- (UIImage *)captureImage;

@end
