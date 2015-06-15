

#import <UIKit/UIKit.h>

@class WBStatusFrame ;
@interface WBStatusTableCell : UITableViewCell

@property(nonatomic,strong)WBStatusFrame *statusFrame ;

+(instancetype) cellWithTable:(UITableView *)tableView ;

@end
