//
//  YZHDefine.h
//  YZHFactory
//
//  Created by 殷志豪 on 2020/7/17.
//  Copyright © 2020 yinzhihao. All rights reserved.
//

#ifndef YZHDefine_h
#define YZHDefine_h

/// 日志输出
#ifdef DEBUG
#define YZHLog(fmt,...) NSLog((@"[Line %d] %s " fmt), __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);
#else
#define YZHLog(...);
#endif

/// 存储
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define USER_DEFAULT_GET(key) [USER_DEFAULT objectForKey:key];
#define USER_DEFAULT_SET(value, key) [USER_DEFAULT setObject:value forKey:key];

//字符串是否为空
#define STRING_IS_EMPTY(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] == 0 ? YES : NO )
//数组是否为空
#define ARRAY_IS_EMPTY(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define DICT_IS_EMPTY(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define OBJECT_IS_EMPTY(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//获取屏幕宽度与高度
#define SCREEN_WIDTH \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
#define SCREEN_SIZE \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

#define IPHONE_6S 375.f
#define SCALE_WIDTH (SCREEN_WIDTH / IPHONE_6S)

#define IS_IPHONE_X_XS   (SCREEN_WIDTH == 812.f)  //是否是iPhoneX、iPhoneXS、iPhone11 Pro
#define IS_IPHONE_XR_XSMax   (SCREEN_WIDTH == 896.f)  //是否是iPhoneXR、iPhoneXS Max、iPhone 11、11Pro Max
#define IS_IPHONE12_MINI   (SCREEN_WIDTH == 812.f)    //是否是iPhone 12 mini
#define IS_IPHONE12  (SCREEN_WIDTH == 844.f)    //是否是iPhone 12、12 Pro
#define IS_IPHONE12_ProMax  (SCREEN_WIDTH == 926.f)    //是否是iPhone 12 Pro Max
#define IS_IPHONEX_SET  (IS_IPHONE_X_XS||IS_IPHONE_XR_XSMax||IS_IPHONE12_MINI||IS_IPHONE12||IS_IPHONE12_ProMax)  //是否是iPhoneX系列手机

/** 获取状态栏高度 */
#define STATUS_BAR_HEIGHT  ((![[UIApplication sharedApplication] isStatusBarHidden]) ? [[UIApplication sharedApplication] statusBarFrame].size.height : (IS_IPHONEX_SET?44.f:20.f))
#define NAVIGATION_BAR_HEIGHT 44.0f
#define TABBAR_HEIGHT (IS_IPHONEX_SET ? 83.0f : 49.0f)
#define SAFE_BOTTOM_HEIGHT (IS_IPHONEX_SET ? 34.0f : 0)

//APP版本号
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define CURRENT_LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

//获取沙盒Document路径
#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define TEMP_PATH NSTemporaryDirectory()
//获取沙盒Cache路径
#define CACHE_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//颜色
#define RGB_COLOR(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA_COLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define RANDOM_COLOR           RGB_COLOR(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))
#define COLOR_WITH_HEX(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

//字体
#define FONT_SYSTEM(s) [UIFont systemFontOfSize:s]
#define FONT_HELVETICA(s) [UIFont fontWithName:@"Helvetica" size:s]
#define FONT_HELVETICA_BOLD(s) [UIFont fontWithName:@"Helvetica-Bold" size:s]
#define FONT_PINGFANG_SC(s) [UIFont fontWithName:@"PingFangSC" size:s]

//由角度转换弧度
#define DEGREES_TO_RADIAN(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define RADIAN_TO_DEGREES(radian) (radian * 180.0) / (M_PI)

#define WO(o) autoreleasepool{} __weak typeof(o) o##Weak = o
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define SS(strongSelf)  __strong __typeof(&*weakSelf)strongSelf = self;

//国际化
#define LOCALIZED_STRING(key) NSLocalizedStringFromTableInBundle(key, @"Localizable", [NSBundle mainBundle], nil) //默认mainBundle
#define LOCALIZED_STRING_IN_BUNDLE(key, bundle) NSLocalizedStringFromTableInBundle(key, @"Localizable", bundle, nil) //bundle自定义
#define LOCALIZED_STRING_FROM_TABLE_IN_BUNDLE(key, table, bundle, comment) NSLocalizedStringFromTableInBundle(key, table, bundle, comment)

//加载图片
#define IMAGE(named) [UIImage imageNamed:named inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil]
#define IMAGE_IN_BUNDLE(named, bundle) [UIImage imageNamed:named inBundle:bundle compatibleWithTraitCollection:nil]

// Block
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

#define SINGLETON_FOR_HEADER( ... ) \
+ (instancetype)shared;

#define SINGLETON_FOR_CLASS( ... ) \
+ (instancetype)shared{ \
static dispatch_once_t once; \
static id __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}


#endif /* YZHDefine_h */
