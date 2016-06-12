//
//  XZQFileTool.m
//  ToolDemo
//
//  Created by 权仔 on 16/6/8.
//  Copyright © 2016年 atyun-监控机. All rights reserved.
//

#import "XZQFileTool.h"

@implementation XZQFileTool


+ (NSString *)getRootPath: (XZQFileToolType)type
{
    switch (type) {
        case XZQFileToolTypeDoctument:
            return [self getDocumentPath];
            break;
            
        case XZQFielToolTypeCache:
            return [self getCachePath];
            break;
            
        case XZQFileToolTypeLibrary:
            return [self getLibraryPath];
            break;
            
        case XZQFileToolTypeTmp:
            return [self getTmpPath];
            break;
            
        default:
            break;
    }
    return nil;
}

+ (NSString *)getDocumentPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getCachePath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getLibraryPath
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getTmpPath
{
    return NSTemporaryDirectory();
}

+ (BOOL)fileIsExists:(NSString *)path
{
    if (path == nil || path.length == 0) {
        return false;
    }
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (NSString *)createFileName:(NSString *)fileName
                        type:(XZQFileToolType)type
                     context:(NSData *)context
{
    if (fileName == nil || fileName.length == 0) {
        return nil;
    }
    fileName = [fileName stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    NSString *path = [[self getRootPath:type] stringByAppendingPathComponent:fileName];
    if (![self fileIsExists:path]) {
        [[NSFileManager defaultManager] createFileAtPath:path contents:context attributes:nil];
    }
    return path;
}

+ (NSData *)readDataWithFileName:(NSString *)fileName
                            type:(XZQFileToolType)type
{
    if (fileName == 0 || fileName.length == 0) {
        return nil;
    }
    fileName = [fileName stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    NSString *path = [[self getRootPath:type] stringByAppendingPathComponent:fileName];
    
    if ([self fileIsExists:path]) {
        return [[NSFileManager defaultManager] contentsAtPath:path];
    }
    
    return nil;
}

@end
