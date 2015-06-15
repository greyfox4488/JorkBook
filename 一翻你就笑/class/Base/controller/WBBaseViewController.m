
#import "WBBaseViewController.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"
//#import "WBTitleButton.h"
//#import "WBPOPView.h"
//#import "AFHTTPRequestOperationManager.h"
//#import "AccountTool.h"
//#import "Account.h"
#import "UIImageView+WebCache.h"
//#import "HMPhoto.h"
#import "MJExtension.h"
#import "HttpTool.h"
//#import "StatusTool.h"
//#import "StatusParamModel.h"
//#import "AccountParamModel.h"
#import "WBStatusTableCell.h"
#import "WBStatusFrame.h"
#import "UIImage+Extension.h"
#import "MJRefresh.h"
#import "AFNetworkReachabilityManager.h"




@interface WBBaseViewController ()

@end

@implementation WBBaseViewController

-(NSMutableArray *)statusFrame{
    
    if (_statusFrame==nil) {
        _statusFrame = [NSMutableArray array] ;
    }
    return _statusFrame ;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:197.0/255.0 blue:154.0/255.0 alpha:1] ;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone ;
    [self setUpNavBar] ;
    
    [self setUpRefreshControl] ;

}


-(void)setUpRefreshControl{
    
    [self.tableView addFooterWithTarget:self action:@selector(loadStatuses)] ;
    
//    UIRefreshControl *fresh = [[UIRefreshControl alloc]init] ;
//    self.fresher = fresh ;
//    [self.tableView addSubview:fresh] ;
//    [fresh addTarget:self action:@selector(loadStatuses) forControlEvents:UIControlEventValueChanged] ;

}


-(void)setUpNavBar{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNorImgName:@"navigationbar_friendsearch" highligntName:@"navigationbar_friendsearch_highlighted" target:nil action:nil] ;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNorImgName:@"navigationbar_pop" highligntName:@"navigationbar_pop_highlighted" target:nil action:nil] ;
    
//    WBTitleButton *butn =[[WBTitleButton alloc]init] ;
//    butn.height = 44 ;
//
//    [butn addTarget:self action:@selector(titleBtnDidClick:) forControlEvents:UIControlEventTouchUpInside] ;
//    [butn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal] ;
//    [butn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected] ;
//    if ([AccountTool account].screen_name) {
//        [butn setTitle:[AccountTool account].screen_name forState:UIControlStateNormal] ;
//    }else{
//        [butn setTitle:@"首页" forState:UIControlStateNormal] ;
//    }
//    
//    self.navigationItem.titleView = butn ;
//    self.titleBtn = butn ;
    
}


-(NSArray *)makeStatusframeFromStatusarray:(NSArray *)statusArray{
    NSMutableArray *ma = [NSMutableArray array] ;
    for (int i=0; i<statusArray.count; i++) {
        WBStatusFrame *tempStatusFrame = [[WBStatusFrame alloc]init] ;
        tempStatusFrame.status =statusArray[i] ;
        [ma addObject:tempStatusFrame] ;
    }
    return ma;
}

-(void)showStatusCount:(NSInteger)statusNumber{
    
//    self.tabBarItem.badgeValue = nil ;
    UILabel *label = [[UILabel alloc]init] ;
    label.text = [NSString stringWithFormat:@"更新了%ld条新的段子",statusNumber] ;
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]] ;
    
    int labelX = 0;
    int labelW = self.view.width;
    int labelH = 37;
    int labelY = 64 -labelH;
    
    label.frame = CGRectMake(labelX, labelY, labelW, labelH) ;
    label.textColor = [UIColor whiteColor] ;
    label.textAlignment = NSTextAlignmentCenter ;
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar] ;
    label.alpha = 0.4 ;
    
    [UIView animateWithDuration:0.6f animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, label.height) ;
        label.alpha = 1 ;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.6 delay:1.4f options:UIViewAnimationOptionCurveEaseOut animations:^{
            label.transform = CGAffineTransformIdentity ;
            label.alpha = 0 ;
        } completion:^(BOOL finished) {
            [label removeFromSuperview] ;
        }] ;
    }] ;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrame.count;
}

-(void)titleBtnDidClick:(UIButton *)btn{
//    btn.selected = !btn.selected;
//    
//    WBPOPView *popView = [[WBPOPView alloc]initWithContent:[UIButton buttonWithType:UIButtonTypeContactAdd]] ;
//    [popView showInRect:CGRectMake(0, 0, 100, 100)] ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    WBStatusTableCell *cell = [WBStatusTableCell cellWithTable:tableView] ;
    WBStatusFrame *statusFrame = self.statusFrame[indexPath.row] ;
    cell.statusFrame = statusFrame ;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    WBStatusTableCell *cell = [WBStatusTableCell cellWithTable:tableView] ;
    WBStatusFrame *statusFrame = self.statusFrame[indexPath.row] ;
    return statusFrame.cellHeight ;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO] ;
//}

@end
