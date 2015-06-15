

#import "WBStatusToolbarView.h"
#import "FOXStatus.h"
#import "UIImage+Extension.h"

typedef enum{
    ToolBarBGLeft,
    ToolBarBGCenter,
    ToolBarBGRight
} ToolBarBg;
#define ToolBarFont [UIFont systemFontOfSize:12]
@interface WBStatusToolbarView()

@property(nonatomic,strong)NSMutableArray *btnArray ;
@property(nonatomic,strong)NSMutableArray *imgrray ;
@property(nonatomic,strong)UIButton *dislikeBtn ;
@property(nonatomic,strong)UIButton *likeBtn ;
@property(nonatomic,strong)UIButton *retweetBtn ;

@end

@implementation WBStatusToolbarView

-(NSMutableArray *)btnArray{
    if (!_btnArray) {
        _btnArray = [NSMutableArray array] ;
    }
    return _btnArray ;
}

-(NSMutableArray *)imgrray{
    if (!_imgrray) {
        _imgrray = [NSMutableArray array] ;
    }
    return _imgrray ;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES ;
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_card_bottom_background"]] ;
        
        self.contentMode = UIViewContentModeCenter ;
        self.likeBtn = [self addChildBtnWithTitle:@"喜欢" img:@"card_toolbar_fav" toolBarBGImg:ToolBarBGLeft] ;
        self.dislikeBtn = [self addChildBtnWithTitle:@"不喜欢" img:@"card_toolbar_feed_trample" toolBarBGImg:ToolBarBGCenter] ;
        self.retweetBtn = [self addChildBtnWithTitle:@"转发" img:@"card_toolbar_share" toolBarBGImg:ToolBarBGRight] ;
        
        
        [self addDivider] ;
        [self addDivider] ;
    }
    return self;
}

-(void)setStatus:(FOXStatus *)status{
    _status = status ;
    [self setBtnTitle:self.retweetBtn title:@"转发" count:16] ;
    [self setBtnTitle:self.dislikeBtn title:@"评论" count:16] ;
    [self setBtnTitle:self.likeBtn title:@"赞" count:16] ;
}

-(void)addDivider{
    
    UIImageView *imgView = [[UIImageView alloc]init] ;
    imgView.contentMode = UIViewContentModeCenter ;
    imgView.image = [UIImage imageNamed:@"timeline_card_bottom_line"] ;
    [self addSubview:imgView] ;
    [self.imgrray addObject:imgView] ;
}

-(void)setBtnTitle:(UIButton *)btn title:(NSString *)title count:(int)count{
    
    if (count>0&&count<10000) {
        title = [NSString stringWithFormat:@"%d",count];
    }else if(count>10000){
        title = [NSString stringWithFormat:@"%.1d万",count/10000];
    }
    [btn setTitle:title forState:UIControlStateNormal] ;
}

-(UIButton *)addChildBtnWithTitle:(NSString *)title img:(NSString *)img toolBarBGImg:(ToolBarBg)toolBarBg {
    
    UIButton *btn = [[UIButton alloc]init] ;

//    [btn.titleLabel setFont:StatusUserNameFont] ;
    btn.userInteractionEnabled = YES ;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0) ;
    [btn.titleLabel setFont:ToolBarFont];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal] ;
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal] ;
    
    switch (toolBarBg) {
        case ToolBarBGLeft:
            [btn setBackgroundImage:[UIImage imageResize:@"card_toolbar_bg_p1"] forState:UIControlStateNormal] ;
            
            [btn addTarget:self action:@selector(likeBtnDidClick:) forControlEvents:UIControlEventTouchUpInside] ;
            
            break;
        case ToolBarBGCenter:
            [btn setBackgroundImage:[UIImage imageResize:@"card_toolbar_bg_p2"] forState:UIControlStateNormal] ;
            [btn addTarget:self action:@selector(disLikeBtnDidClick:) forControlEvents:UIControlEventTouchUpInside] ;
            break;
        case ToolBarBGRight:
            [btn setBackgroundImage:[UIImage imageResize:@"card_toolbar_bg_p3"] forState:UIControlStateNormal] ;
//            [btn addTarget:self action:@selector(likeBtnDidClick:) forControlEvents:UIControlEventTouchUpInside] ;
            break;
            
        default:
            break;
    }
    UIImage *highLightImg = [UIImage
                             imageNamed:@"timeline_card_bottom_background_highlighted"] ;
    
    UIEdgeInsets inset = UIEdgeInsetsMake(highLightImg.size.height*.5f, highLightImg.size.width*.5f, highLightImg.size.height*.5f, highLightImg.size.width*.5f) ;
    
    UIImage *theImg = [highLightImg resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch] ;
    
    [btn setBackgroundImage:theImg forState:UIControlStateHighlighted] ;
    [self addSubview:btn] ;
    [self.btnArray addObject:btn] ;
    return btn ;
}

-(void)likeBtnDidClick:(UIButton *)btn{
    // card_toolbar_feed_praise_p
    [UIView animateWithDuration:.7f animations:^{
        btn.imageView.transform = CGAffineTransformScale([self transformForOrientation], 2.1, 2.1);
        
    } completion:^(BOOL finished) {
        [btn setImage:[UIImage imageNamed:@"card_toolbar_feed_praise_p"] forState: UIControlStateNormal] ;
        
        [self.dislikeBtn setImage:[UIImage imageNamed:@"card_toolbar_feed_trample"] forState: UIControlStateNormal] ;
    }] ;
   
}

-(void)disLikeBtnDidClick:(UIButton *)btn{
    
    
    [UIView animateWithDuration:.7f animations:^{
        btn.imageView.transform = CGAffineTransformScale([self transformForOrientation], 2.1, 2.1);
        
    } completion:^(BOOL finished) {
        [btn setImage:[UIImage imageNamed:@"card_toolbar_feed_trample_p"] forState: UIControlStateNormal] ;
        
        [self.likeBtn setImage:[UIImage imageNamed:@"card_toolbar_fav"] forState: UIControlStateNormal] ;
    }] ;
}

- (CGAffineTransform)transformForOrientation {
	UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
	if (UIInterfaceOrientationLandscapeLeft == orientation) {
		return CGAffineTransformMakeRotation(M_PI*1.5);
	} else if (UIInterfaceOrientationLandscapeRight == orientation) {
		return CGAffineTransformMakeRotation(M_PI/2);
	} else if (UIInterfaceOrientationPortraitUpsideDown == orientation) {
		return CGAffineTransformMakeRotation(-M_PI);
	} else {
		return CGAffineTransformIdentity;
	}
}

-(void)layoutSubviews{
    
    int btnY = 0 ;
    int btnW = self.width/self.btnArray.count ;
    int btnH = self.height ;
    int btnX = btnW ;
    
    for (int i=0; i<self.btnArray.count; i++) {
        UIButton *btn= self.btnArray[i] ;
        btn.frame = CGRectMake(btnX*i, btnY, btnW, btnH) ;
    }
    
    int imgW = 2 ;
    int imgH = self.height*0.5 ;
    int imgX = self.width/(self.imgrray.count+1) ;
    
    for (int i=0; i<self.imgrray.count; i++) {
        UIImageView *imgViewTem= self.imgrray[i] ;
        imgViewTem.width =imgW ;
        imgViewTem.height =imgH ;
        imgViewTem.centerX =imgX*(i+1) ;
        imgViewTem.centerY =self.height*0.5f ;
    }
    
}

@end
