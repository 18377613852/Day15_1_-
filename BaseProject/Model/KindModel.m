//
//  KindModel.m
//  BaseProject
//
//  Created by apple-jd09 on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "KindModel.h"

@implementation KindModel

+(NSArray *)kinds{
    
    FMDatabase *db = [self defaultDatabase];
    FMResultSet *rs = [db executeQuery:@"select * from t_kind"];
    NSMutableArray *dataArr = [NSMutableArray new];
    while ([rs next]) {
        KindModel *model = [KindModel new];
        model.kind = [rs stringForColumn:@"D_KIND"];
        model.num = [rs longForColumn:@"D_NUM"];
        model.introKind = [rs stringForColumn:@"D_INTROKIND"];
        model.introKind2 = [rs stringForColumn:@"D_INTROKIND2"];
        [dataArr addObject:model];
        
    }
    [db closeOpenResultSets];
    [db close];
    
    return [dataArr copy];
    
}

@end










