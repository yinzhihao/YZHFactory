//
//  YZHConvertUtils.m
//  YZHFactory
//
//  Created by 殷志豪 on 2020/7/20.
//  Copyright © 2020 yinzhihao. All rights reserved.
//

#import "YZHConvertUtils.h"

@implementation YZHConvertUtils

#pragma mark - 数据转化

#pragma mark - 1. JSON字符串转化为字典
+ (NSDictionary *)yzh_dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

#pragma mark - 2. 字典转Json字符串

+ (NSString *)yzh_convertToJsonData:(NSDictionary *)dict

{

    NSError *error;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];

    NSString *jsonString;

    if (!jsonData) {

        NSLog(@"%@",error);

    }else{

        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

    }

    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];

    NSRange range = {0,jsonString.length};

    //去掉字符串中的空格

    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];

    NSRange range2 = {0,mutStr.length};

    //去掉字符串中的换行符

    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];

    return mutStr;

}

#pragma mark - 进制转化

#pragma mark - 1. NSData转16进制字符串

+ (NSString *)yzh_hexData2hexString:(NSData *)data
{
    if (!data) {
        return nil;
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        
        unsigned char *dataBytes = (unsigned char*)bytes;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wsign-compare"
        for (NSInteger i = 0; i < byteRange.length; i++) {
            
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            
            if ([hexStr length] == 2) {
                
                [string appendString:hexStr];
                
            } else {
                
                [string appendFormat:@"0%@", hexStr];
                
            }
            
        }
        
    }];
    return string;
}

#pragma mark - 2. 16进制字符串转NSData

+ (NSData *)yzh_hexStr2Data:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wsign-conversion"
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

+ (NSString *)yzh_hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

+ (NSData *)yzh_ToHex:(NSInteger)tmpid
{
    //return [NSString stringWithFormat:@"%X", val]; //未验证
    NSString *nLetterValue;
    NSString *str = @"";
    int ttmpig;
    for (int i = 0; i < 9; i++) {
        ttmpig = tmpid % 16;
        tmpid = tmpid / 16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue = @"A";break;
            case 11:
                nLetterValue = @"B";break;
            case 12:
                nLetterValue = @"C";break;
            case 13:
                nLetterValue = @"D";break;
            case 14:
                nLetterValue = @"E";break;
            case 15:
                nLetterValue = @"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
    }
    
    return [self yzh_hexStr2Data:str];
}

//16进制转10进制
+ (unsigned long long)yzh_convertHexToDecimal:(NSString *)hexStr {
    unsigned long long decimal = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    [scanner scanHexLongLong:&decimal];
    return decimal;
}

/// BCD解码（保留0）
+ (NSString *)yzh_bcdToDec:(NSData *)data {
    char outStr[1024] = {0};
    const unsigned char *bcd = data.bytes;
    
    int i;
    int j = 0;
    for(i = 0; i < data.length; i++) {
        int a = (bcd[i]>>4)&0x0F;
        int b = (bcd[i])&0x0F;
        outStr[j++] = a+'0';
        outStr[j++] = b+'0';
    }
    outStr[j] = '\0';
    
    return [NSString stringWithCString:outStr encoding:NSASCIIStringEncoding];
}

@end
