//
//  CALayer+YZHCategory.h
//  YZHFactory
//
//  Created by NO NAME on 2022/11/4.
//  Copyright © 2022 yzh. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (YZHCategory)

// 动画类型
typedef NS_ENUM(NSInteger, TransitionAnimType){
    
    TransitionAnimTypeRippleEffect=0,
    
    TransitionAnimTypeSuckEffect,
    
    TransitionAnimTypePageCurl,
    
    TransitionAnimTypeOglFlip,
    
    TransitionAnimTypeCube,

    TransitionAnimTypeReveal,
    
    TransitionAnimTypePageUnCurl,
    
    TransitionAnimTypeRamdom,
};
// 方向
typedef NS_ENUM(NSInteger, TransitionSubType){
    
    TransitionSubtypesFromTop=0,
    
    TransitionSubtypesFromLeft,
    
    TransitionSubtypesFromBotoom,
    
    TransitionSubtypesFromRight,
    
    TransitionSubtypesFromRamdom,
};


// 动画曲线
typedef NS_ENUM(NSInteger, TransitionCurve) {
    
    TransitionCurveDefault,
    
    TransitionCurveEaseIn,
    
    TransitionCurveEaseOut,
    
    TransitionCurveEaseInEaseOut,
    
    TransitionCurveLinear,
    
    TransitionCurveRamdom,
};




/**
 *  转场动画
 *
 *  @param animType 转场动画类型
 *  @param subType  转动动画方向
 *  @param curve    转动动画曲线
 *  @param duration 转动动画时长
 *
 *  @return 转场动画实例
 */
-(CATransition *)yzh_transitionWithAnimType:(TransitionAnimType)animType
                                    subType:(TransitionSubType)subType
                                      curve:(TransitionCurve)curve
                                   duration:(CGFloat)duration;

@end

NS_ASSUME_NONNULL_END
