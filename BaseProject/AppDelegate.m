//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    [self movePoetryDBToDoc];
    
    return YES;
}


//因为要进行删除操作

-(void)movePoetryDBToDoc{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Poetry" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:@"sqlite.db"];
    
    NSLog(@"path : %@",path);
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    docPath = [docPath stringByAppendingPathComponent:@"sqlite.db"];
    NSLog(@"docPath : %@",docPath);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:docPath]) {
        [fileManager moveItemAtPath:path toPath:docPath error:nil];
    }

    


}


@end

















