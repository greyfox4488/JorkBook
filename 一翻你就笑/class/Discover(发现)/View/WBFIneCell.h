
#import <UIKit/UIKit.h>

@class WBFineItem ;
@interface WBFIneCell : UITableViewCell

@property(nonatomic,strong)WBFineItem *item ;

+(instancetype)cellWithTableVIew:(UITableView *)tableview ;

-(void)setBackImgWithIndexPath:(NSIndexPath *)indexPath totalCount:(int)rows;
@end
