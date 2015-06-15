

#import "CYPAppDelegate.h"
#import "AFHTTPRequestOperation.h"
#import "AFNetworkReachabilityManager.h"
#import "MBProgressHUD+MJ.h"
#import "SDImageCache.h"
#import "SDWebImageManager.h"
#import "FeatureViewController.h"
#import "WBTabbarController.h"
//#import "AccountTool.h"


@implementation CYPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //开启网络监控
    [self rearchMonitor] ;
    
//    Account *account = [AccountTool account] ;
//    if (account==nil) {
//        self.window.rootViewController = auth ;
//        return YES;
//    }
    NSString *bundleVersionKey = (__bridge NSString *)kCFBundleVersionKey ;
    NSUserDefaults *defualt = [NSUserDefaults standardUserDefaults] ;
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary ;
    NSString *savedVersion = [defualt valueForKey:bundleVersionKey] ;
    NSString *curVersion = [dict valueForKey:bundleVersionKey] ;
    
    if (![curVersion isEqualToString:savedVersion]) {
    
        FeatureViewController *featureController = [[FeatureViewController alloc]init] ;
        self.window.rootViewController = featureController ;
        [defualt setObject:curVersion forKey:bundleVersionKey] ;
        [defualt synchronize] ;
        
    }else{
        WBTabbarController *tabBar = [[WBTabbarController alloc]init] ;
        self.window.rootViewController =tabBar ;
        application.statusBarHidden = NO ;
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    [[SDImageCache sharedImageCache] clearMemory] ;
    [[SDWebImageManager sharedManager] cancelAll] ;
}

-(void)rearchMonitor{
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager] ;
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [MBProgressHUD showError:@"网络异常~"] ;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                [MBProgressHUD showError:@"网络未连接~"] ;
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                break;
            default:
                break;
        }
    }] ;
    
    [mgr startMonitoring] ;
}


@end
