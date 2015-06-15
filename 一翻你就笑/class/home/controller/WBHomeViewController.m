
#import "WBHomeViewController.h"
#import "MJExtension.h"
#import "HttpTool.h"
#import "WBStatusFrame.h"
#import "FOXStatus.h"
#import "MJRefresh.h"
#import "AFNetworkReachabilityManager.h"
#import "WBBIZService.h"


@implementation WBHomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // this is a git test
//    [self.fresher beginRefreshing] ;
    [self.tableView footerBeginRefreshing];
    
//    [self loadStatuses] ;

}


-(void)loadStatuses{

//    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager] ;
//
//    if (!([mgr isReachableViaWiFi]||[mgr isReachableViaWWAN])) return ;
    FOXStatus *lastStatus = nil ;
    if (self.statusFrame.count!=0) {
        lastStatus = [[self.statusFrame lastObject] status] ;
    }
    
    [WBBIZService loadHomeStatus:lastStatus Success:^(NSArray* jiecaoArray) {
        
        NSRange rang = NSMakeRange(self.statusFrame.count, jiecaoArray.count) ;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:rang] ;
        [self.statusFrame insertObjects:[self makeStatusframeFromStatusarray:jiecaoArray] atIndexes:indexSet] ;
        [self.tableView reloadData] ;
        [self.tableView footerEndRefreshing] ;
        [self showStatusCount:jiecaoArray.count] ;
        
    } failure:^(NSError *error) {
         [self.tableView footerEndRefreshing] ;
    }] ;

}

@end
