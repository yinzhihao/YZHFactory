//
//  YZHDecimalNumber.h
//  community
//
//  Created by NO NAME on 2023/8/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZHDecimalNumber : NSObject

/// 乘法
+ (NSString *)yzh_multiplying:(NSString *)string1 string2:(NSString *)string2;

/// 除法
+ (NSString *)yzh_dividing:(NSString *)string1 string2:(NSString *)string2 roundingMode:(NSRoundingMode)roundingMode;

@end

NS_ASSUME_NONNULL_END
