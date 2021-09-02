//
//  YZHFileManager.h
//  YZHFactory
//
//  Created by 殷志豪 on 2020/7/20.
//  Copyright © 2020 yinzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZHFileManager : NSObject

+ (instancetype)shared;

#pragma mark - 文件是否存在
- (BOOL)yzh_fileExistsAtPath:(NSString *)path;

#pragma mark - 创建文件夹
- (BOOL)yzh_creatDir:(NSString *)path;

#pragma mark - 创建文件
- (BOOL)yzh_creatFile:(NSString*)path;

#pragma mark - 删除文件
- (BOOL)yzh_removeFile:(NSString*)path;

#pragma mark - 写入文件
- (BOOL)yzh_writeToFile:(NSString*)path contents:(NSData *)data;

#pragma mark - 追加写入文件
- (BOOL)yzh_appendData:(NSData*)data withPath:(NSString *)path;

#pragma mark - 读取文件
/// 从文件中读取数据
/// @param path 文件完整路径
- (NSData *)yzh_readFileData:(NSString *)path;

#pragma mark - 获取文件夹下的所有文件列表
- (NSArray *)yzh_getFileList:(NSString*)path;

@end
