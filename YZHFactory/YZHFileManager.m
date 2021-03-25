//
//  YZHFileManager.m
//  YZHFactory
//
//  Created by 殷志豪 on 2020/7/20.
//  Copyright © 2020 yinzhihao. All rights reserved.
//

#import "YZHFileManager.h"
#import "YZHDefine.h"

/// 文件管理
#define FILE_MANAGER [NSFileManager defaultManager]

/// Document目录
#define DOC_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
/// Library目录
#define LIB_PATH [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject]
/// Caches目录
#define CHCHES_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
/// Preferences目录 通常情况下，Preferences有系统维护，所以我们很少去操作它
#define PREFER_PATH [LIB_PATH stringByAppendingPathComponent:@"Preferences"]
/// tmp目录
#define TEMP_PATH NSTemporaryDirectory()


@implementation YZHFileManager

+ (instancetype)shared {
    static YZHFileManager *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[YZHFileManager alloc] init];
    });
    return _shared;
}

#pragma mark - 文件是否存在
- (BOOL)fileExistsAtPath:(NSString *)path {
    if (STRING_IS_EMPTY(path)) {
        YZHLog(@"文件不存在 path为空 path=%@",path);
        return NO;
    }
    return [FILE_MANAGER fileExistsAtPath:path];
}

#pragma mark - 创建文件夹
- (BOOL)creatDir:(NSString *)path{
    if (STRING_IS_EMPTY(path)) {
        YZHLog(@"创建文件夹失败 path为空 path=%@",path)
        return NO;
    }
    BOOL isSuccess = YES;
    BOOL isExist = [self fileExistsAtPath:path];
    if (isExist==NO) {
        NSError *error;
        if (![FILE_MANAGER createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
            isSuccess = NO;
            YZHLog(@"creat Directory Failed:%@",[error localizedDescription]);
        }
    }
    return isSuccess;
}

#pragma mark - 创建文件
- (BOOL)creatFile:(NSString*)path{
    if (STRING_IS_EMPTY(path)) {
        YZHLog(@"创建文件失败 path为空 path=%@",path)
        return NO;
    }
    if ([self fileExistsAtPath:path]) {
        return YES;
    }
    NSError *error;
    NSString *dirPath = [path stringByDeletingLastPathComponent];
    BOOL isSuccess = [FILE_MANAGER createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        YZHLog(@"creat File Failed:%@",[error localizedDescription]);
    }
    if (!isSuccess) {
        return isSuccess;
    }
    isSuccess = [FILE_MANAGER createFileAtPath:path contents:nil attributes:nil];
    return isSuccess;
}

#pragma mark - 删除文件
- (BOOL)removeFile:(NSString*)path{
    BOOL isSuccess = NO;
    NSError *error;
    isSuccess = [FILE_MANAGER removeItemAtPath:path error:&error];
    if (error) {
        YZHLog(@"removeFile Field：%@",[error localizedDescription]);
    }else{
        YZHLog(@"removeFile Success");
    }
    return isSuccess;
}

#pragma mark - 写入文件
- (BOOL)writeToFile:(NSString*)path contents:(NSData *)data{
    if (STRING_IS_EMPTY(path)) {
        YZHLog(@"写入文件失败 path为空 path=%@",path)
        return NO;
    }
    BOOL result = [self creatFile:path];
    if (result) {
        if ([data writeToFile:path atomically:YES]) {
            YZHLog(@"write Success");
        }else{
            YZHLog(@"write Failed");
        }
    }
    else{
        YZHLog(@"write Failed");
    }
    return result;
}

#pragma mark - 追加写入文件
- (BOOL)appendData:(NSData*)data withPath:(NSString *)path{
    if (STRING_IS_EMPTY(path)) {
        YZHLog(@"追加写入文件失败 path为空 path=%@",path)
        return NO;
    }
    BOOL result = [self creatFile:path];
    if (result) {
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:path];
        [handle seekToEndOfFile];
        [handle writeData:data];
        [handle synchronizeFile];
        [handle closeFile];
    }
    else{
        YZHLog(@"appendData Failed");
    }
    return result;
}

#pragma mark - 读取文件
/// 从文件中读取数据
/// @param path 文件完整路径
- (NSData *)readFileData:(NSString *)path{
    if (STRING_IS_EMPTY(path)) {
        YZHLog(@"读取文件失败，path为空 path=%@", path)
        return nil;
    }
    if (![self fileExistsAtPath:path]) {
        YZHLog(@"文件不存在 path=%@",path)
        return nil;
    }
    NSData *fileData = [FILE_MANAGER contentsAtPath:path];
    return fileData;
}

#pragma mark - 获取文件夹下的所有文件列表
- (NSArray *)getFileList:(NSString*)path{
    if (STRING_IS_EMPTY(path)) {
        YZHLog(@"获取文件夹下的所有文件列表失败 path为空 path=%@",path)
        return nil;
    }
    if (![self fileExistsAtPath:path]) {
        YZHLog(@"文件不存在 path=%@",path)
        return nil;
    }
    NSError *error;
    NSArray *fileList = [FILE_MANAGER contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        YZHLog(@"getFileList Failed:%@",[error localizedDescription]);
    }
    return fileList;
}

@end
