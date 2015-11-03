//
//  PoetryMode.h
//  BaseProject
//
//  Created by apple-jd09 on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface PoetryMode : BaseModel

@property(nonatomic,strong)NSString *kind;
@property(nonatomic,strong)NSString *shi;
@property(nonatomic,strong)NSString *introShi;

@property(nonatomic,strong)NSString *title;
@property(nonatomic)long ID;
@property(nonatomic,strong)NSString *author;

+(NSArray *)poetryListWithKind:(NSString *)kind;

@end








