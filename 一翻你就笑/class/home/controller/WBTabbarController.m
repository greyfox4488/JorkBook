
#import "WBTabbarController.h"
#import "UIImage+Extension.h"
#import "WBMessageViewController.h"
#import "WBDiscoverViewController.h"
#import "WBProfileViewController.h"
#import "WBHomeViewController.h"
#import "WBNaviController.h"
#import "WBTarbar.h"
//#import "WBInputToolBar.h"
//#import "WBComposeController.h"
//#import "HttpTool.h"
//#import "AccountParamModel.h"
#import "MJExtension.h"
//#import "AccountTool.h"
//#import "Account.h"

@interface WBTabbarController ()<WBTarbarDelegate>

@property(nonatomic,strong)WBHomeViewController *home ;
@property(nonatomic,strong)WBMessageViewController *message ;
@property(nonatomic,strong)WBDiscoverViewController *discover ;
@property(nonatomic,strong)WBProfileViewController *profile ;

@end

@implementation WBTabbarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpSubControllers] ;
    
    [self setUpTabBar] ;
    
    UINavigationBar *navigationItem = [UINavigationBar appearance] ;
    [navigationItem setBackgroundImage:[UIImage imageResize:@"navigationbar_bg_red"] forBarMetrics:UIBarMetricsDefault] ;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary] ;
    dict[NSForegroundColorAttributeName] =[UIColor whiteColor];
    [navigationItem setTitleTextAttributes:dict] ;

}


-(void)setUpTabBar{
    WBTarbar *bar = [[WBTarbar alloc]init] ;
    bar.frame = self.tabBar.bounds ;
    bar.delegate = self ;
    [self setValue:bar forKeyPath:@"tabBar"];
}

-(void)setUpSubControllers{
    
    WBHomeViewController *a = [[WBHomeViewController alloc]init] ;
    
    [self addChildViewController:a withTitle:@"搞笑图" ImageNor:@"tabbar_home" ImageSelected:@"tabbar_home_selected"] ;
    self.home = a ;
    
    WBMessageViewController *message = [[WBMessageViewController alloc] init];
    [self addChildViewController:message withTitle:@"内涵文" ImageNor:@"tabbar_message_center" ImageSelected:@"tabbar_message_center_selected"];
    self.message = message ;
    

    WBDiscoverViewController *discover = [[WBDiscoverViewController alloc] init];
    [self addChildViewController:discover withTitle:@"发现" ImageNor:@"tabbar_discover" ImageSelected:@"tabbar_discover_selected"];
    self.discover = discover ;

    WBProfileViewController *profile = [[WBProfileViewController alloc] init];
    [self addChildViewController:profile withTitle:@"我" ImageNor:@"tabbar_profile" ImageSelected:@"tabbar_profile_selected"];
    self.profile = profile ;
    
}

-(void)plusBtnOnCLick:(UIButton *)btn{
    
//    WBComposeController *contrl = [[WBComposeController alloc]init] ;
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:contrl] ;
//    contrl.placeHolder = @"分享你的新鲜事儿~" ;
//    [self presentViewController:nav animated:YES completion:nil] ;
}

-(void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title ImageNor:(NSString *)imgnor ImageSelected:(NSString *)imgsel {

//    childController.view.backgroundColor = HMRandomColor ;
    childController.title = title ;
    
    UIImage *imgNor = [UIImage imageWithName:imgnor] ;
    imgNor = [imgNor imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    childController.tabBarItem.image = imgNor ;
    
    UIImage *imgSel = [UIImage imageWithName:imgsel] ;
    imgSel = [imgSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    
    childController.tabBarItem.selectedImage =imgSel;

    WBNaviController *nav = [[WBNaviController alloc]initWithRootViewController:childController] ;
    
    [self addChildViewController:nav] ;

}


@end
