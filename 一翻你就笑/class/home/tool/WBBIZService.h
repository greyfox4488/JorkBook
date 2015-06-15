//
//  WBBIZService.h
//  一翻你就笑
//
//  Created by 陈宇平 on 15/6/9.
//  Copyright (c) 2015年 陈宇平. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FOXStatus ;
@interface WBBIZService : NSObject

+(void)loadHomeStatus:(FOXStatus *)status Success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure ;

@end
