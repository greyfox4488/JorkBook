

#define  ImageCount  4

#import "FeatureViewController.h"
#import "UIView+Extension.h"
#import "WBTabbarController.h"

@interface FeatureViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIPageControl *pageControl ;

@end

@implementation FeatureViewController

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init] ;
        
        _pageControl.pageIndicatorTintColor=[UIColor grayColor] ;
        _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor] ;
    }
    return _pageControl ;
}

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
    self.view.backgroundColor = [UIColor yellowColor] ;
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:self.view.bounds] ;
    scroller.contentSize = CGSizeMake(self.view.width*ImageCount, self.view.height) ;
    
    scroller.pagingEnabled = YES ;
    scroller.bounces = NO ;
    scroller.delegate = self ;
    
    int x = self.view.width ;
    int y= 0 ;
    int iwidth = self.view.width ;
    int iheigth =self.view.height ;
    
    for (int i=0; i<ImageCount; i++) {
        
        NSString *imgName = [NSString stringWithFormat:@"new_feature_%d",i+1] ;
        UIImage *img = [UIImage imageNamed:imgName] ;
        UIImageView *imgView = [[UIImageView alloc]init] ;
        imgView.frame = CGRectMake(i*x, y, iwidth, iheigth) ;
        imgView.image = img ;
        [scroller addSubview:imgView] ;
        
        if (i==ImageCount-1) {
            [self setUpLastView:imgView] ;
            
            [self setUpShareView:imgView] ;
        }
    }
    
    [self.view addSubview:scroller] ;
    
    
    self.pageControl.centerX = self.view.width*.5 ;
    self.pageControl.centerY = self.view.height-30 ;
    [self.pageControl setNumberOfPages:ImageCount] ;
    [self.view addSubview:self.pageControl] ;
    
}

-(void)setUpLastView :(UIImageView *)imgView{
    
    imgView.userInteractionEnabled = YES ;
    UIButton *startBtn = [[UIButton alloc]init] ;
    [imgView addSubview:startBtn] ;
    
    UIImage *img = [UIImage imageNamed:@"new_feature_finish_button"] ;
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startBtn setBackgroundImage:img forState: UIControlStateNormal] ;
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal] ;
    [startBtn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside] ;
    
    startBtn.size = img.size ;
    startBtn.x = self.view.width*0.5 -startBtn.size.width*.5 ;
    startBtn.centerY = self.view.height*0.8 ;

}


-(void)start:(UIButton *)btn{
    WBTabbarController *tab = [[WBTabbarController alloc]init] ;
    [UIApplication sharedApplication].keyWindow.rootViewController = tab ;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    double curPage =  scrollView.contentOffset.x/self.view.width ;
    int curPageInt = (int)curPage+0.5f ;
    self.pageControl.currentPage = curPageInt ;
}

-(void)setUpShareView:(UIImageView *)imgView{
    UIButton *shareBtn = [[UIButton alloc]init] ;
    [imgView addSubview:shareBtn] ;
    
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside] ;
    
    shareBtn.size = CGSizeMake(150, 30) ;
    shareBtn.x = self.view.width*0.5 -shareBtn.size.width*.5 ;
    shareBtn.centerY = self.view.height*0.7 ;
    
    
}

- (void)share:(UIButton *)shareButton
{
    shareButton.selected = !shareButton.isSelected;
}

@end
