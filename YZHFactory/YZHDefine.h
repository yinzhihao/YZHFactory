//
//  YZHDefine.h
//  YZHFactory
//
//  Created by 殷志豪 on 2020/7/17.
//  Copyright © 2020 yinzhihao. All rights reserved.
//

#ifndef YZHDefine_h
#define YZHDefine_h

#pragma mark - 日志输出

#ifdef DEBUG
#define YZHLog(fmt,...)                 NSLog((@"[Line %d] %s " fmt), __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__);
#else
#define YZHLog(...);
#endif


#pragma mark - 获取系统对象

#define APPLICATION                     [UIApplication sharedApplication]
#define APP_DELEGATE                    [UIApplication sharedApplication].delegate
#define APP_WINDOW                      [UIApplication sharedApplication].delegate.window
#define ROOT_VIEW_CONTROLLER            [UIApplication sharedApplication].delegate.window.rootViewController
#define USER_DEFAULT                    [NSUserDefaults standardUserDefaults]
#define NOTIFICATION_CENTER             [NSNotificationCenter defaultCenter]

//存储
#define USER_DEFAULT_GET(key)           [USER_DEFAULT objectForKey:key];
#define USER_DEFAULT_SET(value, key)    [USER_DEFAULT setObject:value forKey:key];

#pragma mark - 空判断

//字符串是否为空
#define STRING_IS_EMPTY(str)            ([str isKindOfClass:[NSNull class]] || str == nil || [str length] == 0 ? YES : NO )
//数组是否为空
#define ARRAY_IS_EMPTY(array)           (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define DICT_IS_EMPTY(dic)              (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys.count == 0)
//对象是否为空
#define OBJECT_IS_EMPTY(_object)        (_object == nil \
                                        || [_object isKindOfClass:[NSNull class]] \
                                        || ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
                                        || ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//拼接字符串
#define NSStringFormat(format,...)      [NSString stringWithFormat:format,##__VA_ARGS__]

//发送通知
#define NOTIFICATION_POST(name,obj)     [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

#pragma mark - 获取屏幕信息

//width
#define SCREEN_WIDTH                    \
                                        ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
//height
#define SCREEN_HEIGHT                   \
                                        ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
//bounds
#define SCREEN_BOUNDS                   \
                                        ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGRectMake(0,0,[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds)
//size
#define SCREEN_SIZE                     \
                                        ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)
//scale
#define SCREEN_SCALE                    [UIScreen mainScreen].scale

#pragma mark - 机型判断

// 6s的宽
#define IPHONE_6S                       375.f
// 宽比例
#define SCALE_WIDTH                     (SCREEN_WIDTH / IPHONE_6S)
// 真实宽
#define REAL_WIDTH(width)               (width * SCALE_WIDTH)
            
#define IS_IPHONE_X_XS                  (SCREEN_HEIGHT == 812.f)            //是否是iPhoneX、iPhoneXS、iPhone11 Pro
#define IS_IPHONE_XR_XSMax              (SCREEN_HEIGHT == 896.f)            //是否是iPhoneXR、iPhoneXS Max、iPhone 11、11Pro Max
#define IS_IPHONE12_MINI                (SCREEN_HEIGHT == 812.f)            //是否是iPhone 12 mini
#define IS_IPHONE12                     (SCREEN_HEIGHT == 844.f)            //是否是iPhone 12、12 Pro
#define IS_IPHONE12_ProMax              (SCREEN_HEIGHT == 926.f)            //是否是iPhone 12 Pro Max
#define IS_IPHONE_13_MINI               (SCREEN_HEIGHT == 812.f)            //是否是iPhone 13 mini
#define IS_IPHONE13                     (SCREEN_HEIGHT == 844.f)            //是否是iPhone 13、13 Pro
#define IS_IPHONE13_ProMax              (SCREEN_HEIGHT == 926.f)            //是否是iPhone 13 Pro Max
#define IS_IPHONE14                     (SCREEN_HEIGHT == 844.f)            //是否是iPhone 14
#define IS_IPHONE14_Plus                (SCREEN_HEIGHT == 926.f)            //是否是iPhone 14 Plus
#define IS_IPHONE14_Pro                 (SCREEN_HEIGHT == 852.f)            //是否是iPhone 14 Pro
#define IS_IPHONE14_ProMax              (SCREEN_HEIGHT == 932.f)            //是否是iPhone 14 Pro Max
#define IS_IPHONEX_SET                  (SCREEN_HEIGHT >= 812.f)            //是否是iPhoneX系列手机

//https://www.jianshu.com/p/cb80834e61bf

#pragma mark - 状态栏，导航栏，tabbar，安全区域

#define STATUS_BAR_HEIGHT               ((![[UIApplication sharedApplication] isStatusBarHidden]) ? [[UIApplication sharedApplication] statusBarFrame].size.height : (IS_IPHONEX_SET?44.f:20.f))
#define NAVIGATION_BAR_HEIGHT           44.0f
#define TABBAR_HEIGHT                   (IS_IPHONEX_SET ? 83.0f : 49.0f)
#define SAFE_BOTTOM_HEIGHT              (IS_IPHONEX_SET ? 34.0f : 0)
#define TOP_MARGIN                      ({\
                                            CGFloat top = 0; \
                                            if ([UIViewController yzh_getCurrentVC].navigationController.navigationBar.translucent) { \
                                                top = STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT; \
                                            } else { \
                                                top = 0; \
                                            } \
                                            top; \
                                        })

#pragma mark - 搜索栏高度

#define SEARCH_BAR_HEIGHT               56.0f

#pragma mark - APP信息，设备信息

//APP版本号
#define APP_VERSION                     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//BulidVersion
#define BUILD_VERSION                   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//系统版本号
#define SYSTEM_VERSION                  [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define CURRENT_LANGUAGE                ([[NSLocale preferredLanguages] objectAtIndex:0])
//设备ID
#define APP_DEVICE_UUIDSTRING           [UIDevice currentDevice].identifierForVendor.UUIDString

//获取沙盒Document路径
#define DOCUMENT_PATH                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define TEMP_PATH                       NSTemporaryDirectory()
//获取沙盒Cache路径
#define CACHE_PATH                      [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#pragma mark - 颜色

#define RGB_COLOR(r, g, b)              [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA_COLOR(r, g, b, a)          [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RANDOM_COLOR                    RGB_COLOR(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))
//示例:0xFFFFFF
#define COLOR_WITH_HEX(rgbValue)        \
                                        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                                        green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
                                        blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#pragma mark - 字体

#define FONT_SYSTEM(s)                  [UIFont systemFontOfSize:s]
#define FONT_SYSTEM_BOLD(s)             [UIFont boldSystemFontOfSize:s]
#define FONT_HELVETICA(s)               [UIFont fontWithName:@"Helvetica" size:s]
#define FONT_HELVETICA_BOLD(s)          [UIFont fontWithName:@"Helvetica-Bold" size:s]
#define FONT_PINGFANG_SC(s)             [UIFont fontWithName:@"PingFangSC-Regular" size:s]
#define FONT_PINGFANG_SC_BOLD(s)        [UIFont fontWithName:@"PingFangSC-Semibold" size:s]
#define FONT(NAME, FONTSIZE)            [UIFont fontWithName:(NAME) size:(FONTSIZE)]

#pragma mark - 角度<=>弧度

//由角度转换弧度
#define DEGREES_TO_RADIAN(x)            (M_PI * (x) / 180.0)
//由弧度转换角度
#define RADIAN_TO_DEGREES(radian)       (radian * 180.0) / (M_PI)

#pragma mark - 防止循环引用

#define WO(o)                           autoreleasepool{} __weak typeof(o) o##Weak = o
#define WS(weakSelf)                    __weak __typeof(&*self)weakSelf = self;
#define SS(strongSelf)                  __strong __typeof(&*weakSelf)strongSelf = self;

#pragma mark - 加载图片

#define IMAGE(named)                    [UIImage imageNamed:named inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil]
#define IMAGE_IN_BUNDLE(named, bundle)  [UIImage imageNamed:named inBundle:bundle compatibleWithTraitCollection:nil]

#pragma mark - Block

#define BLOCK_EXEC(block, ...)          if (block) { block(__VA_ARGS__); };

#pragma mark - 单例

#define SINGLETON_FOR_HEADER            \
                                        + (instancetype)shared;

#define SINGLETON_FOR_CLASS             \
                                        + (instancetype)shared{ \
                                        static id _instace; \
                                        static dispatch_once_t onceToken; \
                                        dispatch_once(&onceToken, ^{ \
                                            _instace = [[self alloc] init]; \
                                        }); \
                                        return _instace; \
                                        }

#pragma mark - 国际化

#define LOCALIZED_STRING(key)                                               NSLocalizedStringFromTableInBundle(key, @"Localizable", [NSBundle mainBundle], nil) //默认mainBundle
#define LOCALIZED_STRING_IN_BUNDLE(key, bundle)                             NSLocalizedStringFromTableInBundle(key, @"Localizable", bundle, nil) //bundle自定义
#define LOCALIZED_STRING_FROM_TABLE_IN_BUNDLE(key, table, bundle, comment)  NSLocalizedStringFromTableInBundle(key, table, bundle, comment)


#endif /* YZHDefine_h */
