//
//  YZHDecimalNumber.m
//  community
//
//  Created by NO NAME on 2023/8/7.
//

#import "YZHDecimalNumber.h"

@implementation YZHDecimalNumber

#pragma mark - 乘

+ (NSString *)yzh_multiplying:(NSString *)string1 string2:(NSString *)string2
{
    NSString *resultString = @"0";
    
    if (string1.length == 0) {
        NSLog(@"string1 is empty");
        return resultString;
    }
    if (string2.length == 0) {
        NSLog(@"string2 is empty");
        return resultString;
    }
    
    NSDecimalNumber *num1 = [[NSDecimalNumber alloc] initWithString:string1];
    NSDecimalNumber *num2 = [[NSDecimalNumber alloc] initWithString:string2];
    
    NSDecimalNumber *result = [num1 decimalNumberByMultiplyingBy:num2];
    
    resultString = result.stringValue;
    
    return resultString;
}

#pragma mark - 除法

+ (NSString *)yzh_dividing:(NSString *)string1 string2:(NSString *)string2 roundingMode:(NSRoundingMode)roundingMode
{
    NSString *resultString = @"0";
    
    if (string1.length == 0) {
        NSLog(@"string1 is empty");
        return resultString;
    }
    if (string2.length == 0) {
        NSLog(@"string2 is empty");
        return resultString;
    }
    if ([string2 isEqualToString:@"0"]) {
        NSLog(@"除数不能为0");
        return resultString;
    }
    
    NSDecimalNumber *num1 = [[NSDecimalNumber alloc] initWithString:string1];
    NSDecimalNumber *num2 = [[NSDecimalNumber alloc] initWithString:string2];
    
    NSDecimalNumberHandler *decimalNumberHandle = [[NSDecimalNumberHandler alloc] initWithRoundingMode:roundingMode scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    
    NSDecimalNumber *result = [num1 decimalNumberByDividingBy:num2 withBehavior:decimalNumberHandle];
    
    resultString = result.stringValue;
    
    return resultString;
}

@end
