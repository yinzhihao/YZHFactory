//
//  NSDate+YZHCategory.h
//  YZHFactory
//
//  Created by NO NAME on 2021/4/21.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (YZHCategory)

#pragma mark - NSDate转字符串

//formateString: 时间格式，例如YYYY-MM-DD HH:mm:ss
- (NSString *)yzh_toFormatString:(NSString *)formateString;

@end

NS_ASSUME_NONNULL_END
