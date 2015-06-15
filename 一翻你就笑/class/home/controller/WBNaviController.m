
#import "WBNaviController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"

@interface WBNaviController ()

@end

@implementation WBNaviController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)test2{
    NSLog(@"asd") ;
    NSLog(@"asd") ;
    NSLog(@"asd") ;
}


+(void)initialize{
    UIBarButtonItem *item=[UIBarButtonItem appearance] ;
    NSMutableDictionary *mdNormal = [NSMutableDictionary dictionary] ;
    mdNormal[NSForegroundColorAttributeName] = [UIColor orangeColor] ;
    [item setTitleTextAttributes:mdNormal forState:UIControlStateNormal] ;
    
    NSMutableDictionary *mdDisabled = [NSMutableDictionary dictionary] ;
    mdDisabled[NSForegroundColorAttributeName] = [UIColor lightGrayColor] ;
    [item setTitleTextAttributes:mdDisabled forState:UIControlStateDisabled] ;
    
}

-(void)viewWillAppear:(BOOL)animated{

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.childViewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES ;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNorImgName:@"navigationbar_back" highligntName:@"navigationbar_back_highlighted" target:self action:@selector(back)] ;
                                                           
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNorImgName:@"navigationbar_more" highligntName:@"navigationbar_more_highlighted"target:self action:@selector(home)] ;
    }
    
    [super pushViewController:viewController animated:animated] ;

}

-(void)back{
    [self popViewControllerAnimated:YES] ;
}

-(void)home{
    [self popToRootViewControllerAnimated:YES] ;
}

-(void)setUpAppearance{
    
}
@end
