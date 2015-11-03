//
//  BaseModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation

+ (FMDatabase *)defaultDatabase{
    static FMDatabase *db = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        docPath = [docPath stringByAppendingPathComponent:@"sqlite.db"];
        db = [FMDatabase databaseWithPath:docPath];
        
    });
//    打开数据库
    [db open];
    return db;
}


@end
