//
//  NSString+YZHCategory.m
//  YZHFactory
//
//  Created by NO NAME on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "NSString+YZHCategory.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YZHCategory)

#pragma mark - 正则

- (BOOL) yzh_predicateWithRegex:(NSString *)regex {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL) yzh_isValidMobileNumber {
    NSString *regex = @"^1(3|4|5|7|8)\\d{9}$";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isValidVerifyCode {
    NSString *regex = @"^[0-9]{6}";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isValidRealName {
    NSString *regex = @"^[\u4e00-\u9fa5]{2,8}$";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isOnlyChinese {
    NSString *regex = @"^[\u4e00-\u9fa5]{0,}$";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isValidBankCardNumber {
    NSString *regex = @"^(\\d{16}|\\d{19})$";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isValidEmail{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_validateNickName{
    NSString *regex = @"^[A-Za-z0-9\u4e00-\u9fa5]{1,24}+$";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isValidAlphaNumberPassword{
    NSString *regex = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isValidIdentifyFifteen{
    NSString *regex = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isValidIdentifyEighteen {
    NSString *regex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    return [self yzh_predicateWithRegex:regex];
}

- (BOOL) yzh_isOnlyNumber {
    //方法1：正则
    NSString *regex = @"[0-9]*";
    return [self yzh_predicateWithRegex:regex];
    
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

//转为二维码图像
- (UIImage *)yzh_toQRImageWithSize:(CGFloat)size {
    NSData *stringData = [self dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    CIImage *image = qrFilter.outputImage;
    
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    // Cleanup
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

- (NSDate *)yzh_toDate:(NSString *)formateString
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formateString];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDate *date =[dateFormat dateFromString:self];
    return date;
}

- (NSString *)yzh_md5_32bit {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)self.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

- (CGSize)yzh_sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing wordSpacing:(CGFloat)wordSpacing
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    NSDictionary *attrs = @{
        NSFontAttributeName: font,
        NSParagraphStyleAttributeName: paragraphStyle,
        NSKernAttributeName: @(wordSpacing)
    };
    CGSize size = [self boundingRectWithSize:CGSizeZero
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attrs
                                     context:nil].size;
    return size;
}

@end
