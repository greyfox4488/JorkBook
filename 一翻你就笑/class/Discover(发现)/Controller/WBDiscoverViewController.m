
#import "WBDiscoverViewController.h"
#import "AFNetworkReachabilityManager.h"
#import "WBHomeViewController.h"
#import "MJExtension.h"
#import "HttpTool.h"
#import "WBStatusFrame.h"


@implementation WBDiscoverViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.fresher beginRefreshing] ;
    
    [self loadStatuses] ;
}

-(void)loadStatuses{
    
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager] ;
    if (!([mgr isReachableViaWiFi]||[mgr isReachableViaWWAN])) return ;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary] ;
//    WBStatusFrame *statusFrame= [self.statusFrame lastObject] ;
    params[@"max_id"] = @"0" ;
    params[@"r"] = @"statuses/list" ;
    params[@"kind"] = @"1" ;
    params[@"search"] = @"hot" ;
    params[@"imei"] = @"6A6F5C80-546B-446E-8510-F60B93F6C61C" ;
    params[@"wuid"] = @"1144900432" ;
    params[@"machine"] = @"iPhone" ;
    params[@"osver"] = @"8.20" ;
    params[@"ver"] = @"4.1" ;
    params[@"network"] = @"1" ;
    params[@"wm"] = @"1234_1234" ;
    params[@"channel"] = @"free" ;
    params[@"perpage"] = @"20" ;
    params[@"refresh_id"] = @"792454" ;
    params[@"si"] = @"a9a0fd7527939ee51faff2cca199846a" ;
    
    [HttpTool GET:@"http://zhaojiecao.sinaapp.com/api/chastity.php" parameters:params success:^(id responseObject) {
        NSArray *jiecaoArray = [FOXStatus objectArrayWithKeyValuesArray:responseObject[@"list"]] ;
        NSRange rang = NSMakeRange(jiecaoArray.count,0) ;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:rang] ;
        [self.statusFrame insertObjects:[self makeStatusframeFromStatusarray:jiecaoArray] atIndexes:indexSet] ;
        [self.tableView reloadData] ;
        [self.fresher endRefreshing] ;
        [self showStatusCount:jiecaoArray.count] ;
        
    } failure:^(NSError *error) {
        [self.fresher endRefreshing] ;
    }] ;
}

@end
