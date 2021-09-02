//
//  NSDate+YZHCategory.m
//  YZHFactory
//
//  Created by NO NAME on 2021/4/21.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "NSDate+YZHCategory.h"

@implementation NSDate (YZHCategory)

#pragma mark - NSDate转字符串

- (NSString *)yzh_toFormatString:(NSString *)formateString
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formateString];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSString *string = [dateFormat stringFromDate:self];
    return string;
}

@end
