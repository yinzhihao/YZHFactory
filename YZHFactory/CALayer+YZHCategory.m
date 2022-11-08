//
//  CALayer+YZHCategory.m
//  YZHFactory
//
//  Created by NO NAME on 2022/11/4.
//  Copyright © 2022 yzh. All rights reserved.
//

#import "CALayer+YZHCategory.h"

@implementation CALayer (YZHCategory)


/**
 *  转场动画
 *  @param animType 转场动画类型
 *  @param subType  转动动画方向
 *  @param curve    转动动画曲线
 *  @param duration 转动动画时长
 *  @return 转场动画实例
 */
-(CATransition *)yzh_transitionWithAnimType:(TransitionAnimType)animType
                                    subType:(TransitionSubType)subType
                                      curve:(TransitionCurve)curve
                                   duration:(CGFloat)duration{
    
    NSString *key = @"transition";
    
    if([self animationForKey:key]!=nil){
        [self removeAnimationForKey:key];
    }
    
    
    CATransition *transition=[CATransition animation];
    
    //动画时长
    transition.duration=duration;
    
    //动画类型
    transition.type=[self animaTypeWithTransitionType:animType];
    
    //动画方向
    transition.subtype=[self animaSubtype:subType];
    
    //缓动函数
    transition.timingFunction=[CAMediaTimingFunction functionWithName:[self curve:curve]];
    
    //完成动画删除
    transition.removedOnCompletion = YES;
    
    [self addAnimation:transition forKey:key];
    
    return transition;
}



// 返回动画曲线
-(NSString *)curve:(TransitionCurve)curve{
    
    //曲线数组
    NSArray *funcNames=@[kCAMediaTimingFunctionDefault,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionLinear];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wsign-conversion"
    return [self objFromArray:funcNames index:curve isRandom:(TransitionCurveRandom == curve)];
}



/*
 *  返回动画方向
 */
-(NSString *)animaSubtype:(TransitionSubType)subType{
    
    //设置转场动画的方向
    NSArray *subtypes=@[kCATransitionFromTop,kCATransitionFromLeft,kCATransitionFromBottom,kCATransitionFromRight];
    
    return [self objFromArray:subtypes index:subType isRandom:(TransitionSubtypesFromRandom == subType)];
}




/*
 *  返回动画类型
 */
-(NSString *)animaTypeWithTransitionType:(TransitionAnimType)type{
    
    //设置转场动画的类型
    NSArray *animArray=@[@"rippleEffect",@"suckEffect",@"pageCurl",@"oglFlip",@"cube",@"reveal",@"pageUnCurl"];
    
    return [self objFromArray:animArray index:type isRandom:(TransitionAnimTypeRandom == type)];
}



// 统一从数据返回对象
-(id)objFromArray:(NSArray *)array index:(NSUInteger)index isRandom:(BOOL)isRandom{
    NSUInteger count = array.count;
    
    NSUInteger i = isRandom?arc4random_uniform((u_int32_t)count) : index;
    return array[i];
}

@end
