
#import <UIKit/UIKit.h>
#import "FOXStatus.h"

@interface WBBaseViewController : UITableViewController

@property(nonatomic,strong)UIRefreshControl *fresher;
@property(nonatomic,strong)NSMutableArray *statusFrame ;

-(NSMutableArray *)statusFrame ;

-(NSArray *)makeStatusframeFromStatusarray:(NSArray *)statusArray ;

-(void)showStatusCount:(NSInteger)statusNumber ;

@end
