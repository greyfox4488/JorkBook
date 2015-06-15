//
//  WBBIZService.m
//  一翻你就笑
//
//  Created by 陈宇平 on 15/6/9.
//  Copyright (c) 2015年 陈宇平. All rights reserved.
//

#import "WBBIZService.h"
#import "MJExtension.h"
#import "HttpTool.h"
#import "WBStatusFrame.h"
#import "FOXStatus.h"
#import "MJRefresh.h"
#import "AFNetworkReachabilityManager.h"
#import "FMDB.h"

@implementation WBBIZService

static FMDatabase *db ;

+(void)initialize{
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *filePath = [path stringByAppendingPathComponent:@"status3.sqlite"] ;
    db = [FMDatabase databaseWithPath:filePath] ;
    
    if ([db open]) {
//        [db executeUpdate:@"drop table t_status "] ;
      BOOL isOK=  [db executeUpdate:@"create table if not exists t_status (id integer PRIMARY KEY AUTOINCREMENT, t_maxid integer NOT NULL,t_category text NOT NULL, status_dict blob);"] ;
        if (isOK) {
//            NSLog(@"创建成功~") ;
        }else{
//            NSLog(@"创建失败") ;
        }
    }
}

+(NSArray *)loadStatusFromDB{
    
    FMResultSet *resultSet= [db executeQuery:@"select * from t_status order by id desc limit 20 ;"] ;

    NSMutableArray *array = [NSMutableArray array] ;
    while([resultSet next]){
       NSData *data = [resultSet objectForColumnName:@"status_dict"] ;
       NSDictionary *statusDict = [NSKeyedUnarchiver unarchiveObjectWithData:data] ;
        FOXStatus *sta = [FOXStatus objectWithKeyValues:statusDict] ;
        [array addObject:sta] ;
    }

    return array ;
}

+(void)loadHomeStatus:(FOXStatus *)status Success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager] ;

    if (([mgr isReachableViaWiFi]||[mgr isReachableViaWWAN])) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary] ;
        params[@"max_id"] = @"0" ;
        params[@"r"] = @"statuses/list" ;
        params[@"kind"] = @"1" ;
        params[@"search"] = @"random" ;
        params[@"imei"] = @"6A6F5C80-546B-446E-8510-F60B93F6C61C" ;
        params[@"wuid"] = @"1144900432" ;
        params[@"machine"] = @"iPhone" ;
        params[@"osver"] = @"8.20" ;
        params[@"ver"] = @"4.1" ;
        params[@"network"] = @"1" ;
        params[@"wm"] = @"1234_1234" ;
        params[@"channel"] = @"free" ;
        params[@"perpage"] = @"20" ;
        params[@"refresh_id"] = @"110247" ;
        params[@"si"] = @"81ed0511b64862b84b21a862d6bdc0b7" ;
        
        [HttpTool GET:@"http://zhaojiecao.sinaapp.com/api/chastity.php" parameters:params success:^(id responseObject) {
            [self saveStatus2db:responseObject[@"list"]] ;
            
            NSArray *jiecaoArray = [FOXStatus objectArrayWithKeyValuesArray:responseObject[@"list"]] ;
            if(success){
                success(jiecaoArray) ;
            }
        } failure:^(NSError *error) {
            if (failure) {
                failure(error) ;
            }
        }] ;

    }else{
       NSArray *tempArray = [self loadStatusFromDB] ;
        if(tempArray.count){
            if (success) {
                success(tempArray) ;
            }
        }
    }
}

+(void)saveStatus2db:(NSArray *)jiecaoDict{
    
    for (NSDictionary *dict in jiecaoDict) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dict] ;
        [db executeUpdate:@"insert into t_status (t_category,t_maxid,status_dict) values(?,?,?) ;",@"test",dict[@"wuid"],data] ;
        
    }
    
}

@end
