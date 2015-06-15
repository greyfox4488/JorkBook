
#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

+(void)GET:(NSString *)url parameters:(NSDictionary *) dict success:(void(^)(id))success failure:(void(^)(NSError *)) failure;

+(void)POST:(NSString *)url parameters:(NSDictionary *) dict success:(void(^)(id))success failure:(void(^)(NSError *)) failure;

@end
