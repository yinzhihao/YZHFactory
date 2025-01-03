//
//  NSString+YZHCategory.h
//  YZHFactory
//
//  Created by NO NAME on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YZHCategory)

#pragma mark - 正则

//通用正则方法，例如 [smsCode predicateWithRegex:@"^[0-9]{6}"];
- (BOOL) yzh_predicateWithRegex:(NSString *)regex;

//有效的电话号码
- (BOOL) yzh_isValidMobileNumber;

//有效的真实姓名
- (BOOL) yzh_isValidRealName;

//是否只有中文
- (BOOL) yzh_isOnlyChinese;

//有效的验证码,6位(根据自家的验证码位数进行修改)
- (BOOL) yzh_isValidVerifyCode;

//有效的银行卡号
- (BOOL) yzh_isValidBankCardNumber;

//有效的邮箱
- (BOOL) yzh_isValidEmail;

//有效的字母数字密码
- (BOOL) yzh_isValidAlphaNumberPassword;

//检测有效身份证
//15位
- (BOOL) yzh_isValidIdentifyFifteen;

//18位
- (BOOL) yzh_isValidIdentifyEighteen;

//限制只能输入数字
- (BOOL) yzh_isOnlyNumber;

#pragma mark - 转为二维码图像
- (UIImage *) yzh_toQRImageWithSize:(CGFloat)size;

#pragma mark - 字符串转NSDate

//formateString: 时间格式，例如yyyy-MM-dd HH:mm:ss
- (NSDate *)yzh_toDate:(NSString *)formateString;

/*
 * MD5
 */
- (NSString *)yzh_md5_32bit;

/*
 * 获取文本实际大小
 */
- (CGSize)yzh_sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing wordSpacing:(CGFloat)wordSpacing;

@end

NS_ASSUME_NONNULL_END
