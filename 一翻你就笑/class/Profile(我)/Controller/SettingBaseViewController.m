
#import "SettingBaseViewController.h"
#import "UIImage+Extension.h"
#import "WBFineGroup.h"
#import "WBFineItem.h"
#import "WBFIneCell.h"
#import "WBFineItemArrow.h"
#import "WBFineItemSwich.h"
#import "WBFineItemLabel.h"


@interface SettingBaseViewController ()

@property(nonatomic,strong)NSMutableArray *groups ;

@end

@implementation SettingBaseViewController

-(NSMutableArray *)groups{
    if (!_groups) {
        _groups = [NSMutableArray array] ;
    }
    return _groups ;
}


-(id)init{
    return [self initWithStyle:UITableViewStyleGrouped] ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.sectionFooterHeight = 0 ;
    self.tableView.sectionHeaderHeight = StatusCellMargin ;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone ;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    WBFineGroup *group = self.groups[section] ;
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WBFineGroup *group = self.groups[indexPath.section] ;
    WBFineItem *item = group.items[indexPath.row] ;
    WBFIneCell *cell = [WBFIneCell cellWithTableVIew:tableView] ;
    cell.item = item ;
    [cell setBackImgWithIndexPath:indexPath totalCount:group.items.count] ;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WBFineGroup *group = self.groups[indexPath.section] ;
    WBFineItem *item = group.items[indexPath.row] ;
    if (item.action) {
        item.action() ;
    }
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES] ;
}
@end
