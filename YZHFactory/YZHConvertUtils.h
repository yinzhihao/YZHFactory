//
//  YZHConvertUtils.h
//  YZHFactory
//
//  Created by NO NAME on 2020/7/20.
//  Copyright © 2020 yinzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZHConvertUtils : NSObject

#pragma mark - 数据转化

#pragma mark - 1. JSON字符串转化为字典

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

#pragma mark - 2. 字典转Json字符串

+ (NSString *)convertToJsonData:(NSDictionary *)dict;

#pragma mark - 进制转化

#pragma mark - 1. NSData转16进制字符串

+ (NSString *)hexData2hexString:(NSData *)data;

#pragma mark - 2. 16进制字符串转NSData

+ (NSData *)hexStr2Data:(NSString *)str;

@end
