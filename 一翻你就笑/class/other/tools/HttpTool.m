

#import "HttpTool.h"
#import "AFHTTPRequestOperationManager.h"

@implementation HttpTool

+(void)GET:(NSString *)url parameters:(NSDictionary *)dict success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{

    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager] ;
    [mgr GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject){
        if (success) {
            success(responseObject) ;
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            success(error) ;
        }
    }] ;
}

+(void)POST:(NSString *)url parameters:(NSDictionary *)dict success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager] ;
    [mgr POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject){
        if (success) {
            success(responseObject) ;
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            success(error) ;
        }
    }] ;
}


@end
