//
//  XZQFileTool.h
//  ToolDemo
//
//  Created by 权仔 on 16/6/8.
//  Copyright © 2016年 atyun-监控机. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    XZQFileToolTypeDoctument,
    XZQFielToolTypeCache,
    XZQFileToolTypeLibrary,
    XZQFileToolTypeTmp
} XZQFileToolType;

@interface XZQFileTool : NSObject

/**
 *  获取Document路径
 *
 *  @return 路径
 */
+ (NSString *)getDocumentPath;

/**
 *  获取Cache路径
 *
 *  @return 路径
 */
+ (NSString *)getCachePath;

/**
 *  获取Library路径
 *
 *  @return 路径
 */
+ (NSString *)getLibraryPath;

/**
 *  获取Tmp路径
 *
 *  @return 路径
 */
+ (NSString *)getTmpPath;

/**
 *  判断此路径下是否存在此文件
 *
 *  @param path 文件路径
 *
 *  @return 判断结果
 */
+ (BOOL)fileIsExists:(NSString *)path;

/**
 *  创建目录下文件
 *  一般来说，文件要么放在Document，要么放在Library下的Cache里面
 *  这里也是只提供两种存放路径
 *
 *  @param fileName 文件名
 *  @param type     路径类型
 *  @param context  数据内容
 *
 *  @return 文件路径
 */
+ (NSString *)createFileName:(NSString *)fileName
                        type:(XZQFileToolType)type
                     context:(NSData *)context;

/**
 *  读取文件
 *
 *  @param fileName 文件名称
 *  @param type     文件路径类型
 *
 *  @return 文件内容
 */
+ (NSData *)readDataWithFileName:(NSString *)fileName
                            type:(XZQFileToolType)type;

@end
