//
//  YZHDefine.h
//  YZHFactory
//
//  Created by NO NAME on 2020/7/17.
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
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] == 0 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//获取屏幕宽度与高度
#define kScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
#define kScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
#define kScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

#define IS_IPHONEX_XS   (kScreenHeight == 812.f)  //是否是iPhoneX、iPhoneXS
#define IS_IPHONEXR_XSMax   (kScreenHeight == 896.f)  //是否是iPhoneXR、iPhoneX Max
#define IS_IPHONEX_SET  (IS_IPHONEX_XS||IS_IPHONEXR_XSMax)  //是否是iPhoneX系列手机

/** 获取状态栏高度 */
#define State_Bar_H  ((![[UIApplication sharedApplication] isStatusBarHidden]) ? [[UIApplication sharedApplication] statusBarFrame].size.height : (IS_IPHONEX_SET?44.f:20.f))
#define NavigationBarHeight 44.0f
#define StatusBarWithNavigationBarHeight (State_Bar_H+NavigationBarHeight)
#define TabBarHeight (IS_IPHONEX_SET ? 83.0f : 49.0f)

//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//APP版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define kSystemVersion [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//判断是否为iPhone
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//获取沙盒Document路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define kTempPath NSTemporaryDirectory()
//获取沙盒Cache路径
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//真机
#endif

#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif

//颜色
#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor           kRGBColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))

#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define SS(strongSelf)  __strong __typeof(&*weakSelf)strongSelf = self;

//国际化
#define kLocalizedString(key) NSLocalizedStringFromTableInBundle(key, @"Localizable", [NSBundle mainBundle], nil) //默认mainBundle
#define kLocalizedStringInBundle(key, bundle) NSLocalizedStringFromTableInBundle(key, @"Localizable", bundle, nil) //bundle自定义
#define kLocalizedStringFromTableInBundle(key, table, bundle, comment) NSLocalizedStringFromTableInBundle(key, table, bundle, comment)

//加载图片
#define kImage(named) [UIImage imageNamed:named inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil]
#define kImageInBundle(named, bundle) [UIImage imageNamed:named inBundle:bundle compatibleWithTraitCollection:nil]

// Block
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

//#define SINGLETON_FOR_HEADER( ... ) \
//+ (instancetype)sharedInstance;
//
//#define SINGLETON_FOR_CLASS( ... ) \
//+ (instancetype)sharedInstance{ \
//static dispatch_once_t once; \
//static id __singleton__; \
//dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
//return __singleton__; \
//}


#endif /* YZHDefine_h */
