//
//  KindModel.h
//  BaseProject
//
//  Created by apple-jd09 on 15/10/28.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface KindModel : BaseModel

@property(nonatomic,strong)NSString *kind;
@property(nonatomic)long num;
@property(nonatomic,strong)NSString *introKind;
@property(nonatomic,strong)NSString *introKind2;

+(NSArray *)kinds;

@end








