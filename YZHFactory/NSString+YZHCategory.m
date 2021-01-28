//
//  NSString+YZHCategory.m
//  YZHFactory
//
//  Created by NO NAME on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "NSString+YZHCategory.h"

@implementation NSString (YZHCategory)

#pragma mark - 正则

- (BOOL) predicateWithRegex:(NSString *)regex {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL) isValidMobileNumber {
    NSString *regex = @"^1(3|4|5|7|8)\\d{9}$";
    return [self predicateWithRegex:regex];
}

- (BOOL) isValidVerifyCode {
    NSString *regex = @"^[0-9]{6}";
    return [self predicateWithRegex:regex];
}

- (BOOL) isValidRealName {
    NSString *regex = @"^[\u4e00-\u9fa5]{2,8}$";
    return [self predicateWithRegex:regex];
}

- (BOOL) isOnlyChinese {
    NSString *regex = @"^[\u4e00-\u9fa5]{0,}$";
    return [self predicateWithRegex:regex];
}

- (BOOL) isValidBankCardNumber {
    NSString *regex = @"^(\\d{16}|\\d{19})$";
    return [self predicateWithRegex:regex];
}

- (BOOL) isValidEmail{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self predicateWithRegex:regex];
}

- (BOOL) validateNickName{
    NSString *regex = @"^[A-Za-z0-9\u4e00-\u9fa5]{1,24}+$";
    return [self predicateWithRegex:regex];
}

- (BOOL) isValidAlphaNumberPassword{
    NSString *regex = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
    return [self predicateWithRegex:regex];
}

- (BOOL) isValidIdentifyFifteen{
    NSString *regex = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    return [self predicateWithRegex:regex];
}

- (BOOL) isValidIdentifyEighteen {
    NSString *regex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    return [self predicateWithRegex:regex];
}

- (BOOL) isOnlyNumber {
    //方法1：正则
    NSString *regex = @"[0-9]*";
    return [self predicateWithRegex:regex];
    
    //方法2：NSCharacterSet
    /*
    NSString *str = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if (str.length > 0) {
        return NO;
    } else {
        return YES;
    }*/
    
    //方法3：NSScanner
    /*
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInteger:val] && [scan isAtEnd];
     */
    
    //方法4
    /*
    BOOL res = YES;
    NSCharacterSet *tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSUInteger i = 0;
    while (i < self.length) {
        NSString * string = [self substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    
    return res;
     */
}

@end
