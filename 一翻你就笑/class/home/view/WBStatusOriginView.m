
#import "WBStatusOriginView.h"
#import "UIImageView+WebCache.h"
//#import "Account.h"
#import "FOXStatus.h"
#import "WBStatusOraginFrame.h"
//#import "WBStatusPhotosView.h"
#import "SDProgressView.h"


@interface WBStatusOriginView()

@property(nonatomic,strong)UILabel * userName ;
@property(nonatomic,strong)UILabel * source ;
@property(nonatomic,strong)UILabel * postTime ;
@property(nonatomic,strong)UILabel * textView ;
@property(nonatomic,strong)UIImageView * contentPic ;
//@property(nonatomic,weak)SDLoopProgressView * progressView ;

//@property(nonatomic,strong)WBStatusPhotosView *photosView ;

@end

@implementation WBStatusOriginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES ;
        self.backgroundColor = [UIColor whiteColor] ;
                
        UILabel* userName = [[UILabel alloc]init] ;
        self.userName = userName ;
        self.userName.textColor = [UIColor lightGrayColor] ;
        self.userName.font = StatusUserNameFont ;
//        self.userName.backgroundColor = [UIColor redColor] ;
        [self addSubview:userName] ;

        UILabel* label = [[UILabel alloc]init] ;
        label.font = StatusMainTextFont ;
        label.numberOfLines = 0 ;
//        label.showsHorizontalScrollIndicator = NO ;
//        textView.showsVerticalScrollIndicator = NO ;
//        label.scrollEnabled = NO ;
//        textView.editable = NO ;
//        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        label.backgroundColor = [UIColor clearColor] ;
        self.textView = label ;
        [self addSubview:label] ;
//
        UIImageView* contentPic = [[UIImageView alloc]init] ;
        self.contentPic = contentPic ;
        [self addSubview:contentPic] ;
        

//        WBStatusPhotosView *photoView = [[WBStatusPhotosView alloc]init] ;
//        [self addSubview:photoView] ;
//        self.photosView = photoView ;
        
    }
    return self;
}

-(void)setOrginViewFrame:(WBStatusOraginFrame *)orginViewFrame{
    _orginViewFrame = orginViewFrame ;
    self.frame = orginViewFrame.frame ;
    FOXStatus *status = orginViewFrame.status ;
    
    self.userName.text = status.nick ;
    self.userName.frame = orginViewFrame.userNameFrame ;
    
    self.textView.text = status.content ;
    self.textView.frame = orginViewFrame.textViewFrame ;


//    self.progressView = progressView ;
//    [self addSubview:progressView] ;
    SDLoopProgressView *progressView = [SDLoopProgressView progressView];
    UIView *lastProgressVIew =  [self viewWithTag:99] ;
    [lastProgressVIew removeFromSuperview] ;
     progressView.tag = 99 ;
    [self addSubview:progressView] ;
    
    int myWidth = self.width ;
    int myHeight = self.height ;
    
    __weak typeof (progressView) weekProgressView = progressView ;
    
    
    NSURL *url = [NSURL URLWithString:status.pic_url] ;
    [self.contentPic setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default_big"] options:SDWebImageCacheMemoryOnly||SDWebImageRetryFailed   progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        __weak
        weekProgressView.frame = orginViewFrame.contentPicFrame ;
        weekProgressView.frame = CGRectMake((myWidth-80)*0.5, (myHeight-80)*0.5, 80, 80) ;
        weekProgressView.height = 80 ;
        float showProgress = (float)receivedSize/(float)expectedSize;
        weekProgressView.progress = showProgress ;
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        [weekProgressView removeFromSuperview] ;
    }] ;
    self.contentPic.frame = orginViewFrame.contentPicFrame ;
        
//    self.photosView.photoArray =status.pic_urls ;
//    self.photosView.frame = orginViewFrame.photoFrame ;
    
}

-(void)dealloc{
    
}

@end
