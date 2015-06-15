
#import "WBProfileViewController.h"
#import "UIImage+Extension.h"
#import "WBFineGroup.h"
#import "WBFineItem.h"
#import "WBFIneCell.h"
#import "WBFineItemArrow.h"
#import "WBFineItemSwich.h"
#import "WBFineItemLabel.h"
#import "MBProgressHUD+MJ.h"
#import "NSString+File.h"
#import "SDImageCache.h"
#import "SDImageCache.h"

@interface WBProfileViewController ()
@end

@implementation WBProfileViewController

-(id)init{
    return [self initWithStyle:UITableViewStyleGrouped] ;
}

- (void)viewDidLoad
{
    [self setupGroup] ;
    [super viewDidLoad];
    UIImageView *imgview =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"setting_bg"]] ;
    imgview.size = CGSizeMake(StandardWidth, 120) ;
    self.tableView.tableHeaderView = imgview ;
//    UIEdgeInsets inset = UIEdgeInsetsMake(130, 0, 0, 0) ;
//    self.tableView.contentInset = inset ;
}

-(NSString *)getFileSize:(long)byteSize{
    
    NSString *fileSize  = [NSString stringWithFormat:@"%.1f M",byteSize /(1000.0*1000.0)] ;
    return fileSize ;
}

-(void)setupGroup{
    
    // 1.创建组
    WBFineGroup *group0 = [WBFineGroup group];
    // 2.设置组的所有行数据
    WBFineItemArrow *empty = [WBFineItemArrow itemWithIcon:@"new_friend" title:@""];
    WBFineItemArrow *clearCache = [WBFineItemArrow itemWithIcon:@"setting_delete" title:@"清除缓存"];
    clearCache.Subtitle = [self getFileSize:[[SDImageCache sharedImageCache] getSize]] ;
    __weak typeof (clearCache) weakCache =clearCache ;
    clearCache.action = ^{
        [[SDImageCache sharedImageCache] clearDisk];

        [MBProgressHUD showSuccess:[NSString stringWithFormat:@"清理了%@缓存",weakCache.Subtitle]] ;
        weakCache.Subtitle = nil ;
        [self.tableView reloadData];
    } ;
    WBFineItemArrow *checkUpdate = [WBFineItemArrow itemWithIcon:@"setting_update" title:@"检查更新"];
    checkUpdate.action = ^{
        [MBProgressHUD showSuccess:@"已经是最新版本"] ;
    } ;
    WBFineItemArrow *aboutUs = [WBFineItemArrow itemWithIcon:@"setting_about" title:@"关于我们"];
    aboutUs.action = ^{
        [MBProgressHUD showSuccess:@"感谢您使用我们的App~"] ;
    } ;
    group0.items = @[empty,clearCache,checkUpdate,aboutUs];
    [self.groups addObject:group0] ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath] ;
    [super tableView:tableView didDeselectRowAtIndexPath:indexPath] ;
}

@end
