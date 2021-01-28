//
//  NSString+YZHCategory.h
//  YZHFactory
//
//  Created by NO NAME on 2021/1/26.
//  Copyright © 2021 yzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YZHCategory)

#pragma mark - 正则

//通用正则方法，例如 [smsCode predicateWithRegex:@"^[0-9]{6}"];
- (BOOL) predicateWithRegex:(NSString *)regex;

//有效的电话号码
- (BOOL) isValidMobileNumber;

//有效的真实姓名
- (BOOL) isValidRealName;

//是否只有中文
- (BOOL) isOnlyChinese;

//有效的验证码,6位(根据自家的验证码位数进行修改)
- (BOOL) isValidVerifyCode;

//有效的银行卡号
- (BOOL) isValidBankCardNumber;

//有效的邮箱
- (BOOL) isValidEmail;

//有效的字母数字密码
- (BOOL) isValidAlphaNumberPassword;

//检测有效身份证
//15位
- (BOOL) isValidIdentifyFifteen;

//18位
- (BOOL) isValidIdentifyEighteen;

//限制只能输入数字
- (BOOL) isOnlyNumber;

@end

NS_ASSUME_NONNULL_END
