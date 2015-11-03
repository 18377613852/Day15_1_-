//
//  PoetryMode.m
//  BaseProject
//
//  Created by apple-jd09 on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PoetryMode.h"

@implementation PoetryMode

+(NSArray *)poetryListWithKind:(NSString *)kind{
    
    FMDatabase *db = [self defaultDatabase];
    FMResultSet *rs = [db executeQueryWithFormat:@"select * from t_shi where d_kind = %@",kind];
    NSMutableArray *dataArr = [NSMutableArray new];
    while ([rs next]) {
        PoetryMode *model = [self new];
        model.kind = [rs stringForColumn:@"d_kind"];
        model.author = [rs stringForColumn:@"d_author"];
        model.shi = [rs stringForColumn:@"d_shi"];
        model.title = [rs stringForColumn:@"d_title"];
        model.ID = [rs longForColumn:@"d_id"];
        model.introShi = [rs stringForColumn:@"d_introshi"];
        [dataArr addObject:model];
    }
    [db close];
    return [dataArr copy];
}

@end








