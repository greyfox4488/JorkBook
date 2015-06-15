

#import "WBStatusDetailView.h"
#import "WBStatusDetailFrame.h"
#import "WBStatusOraginFrame.h"
#import "UIImage+Extension.h"
#import "WBStatusOriginView.h"

@interface WBStatusDetailView()

@property(nonatomic,strong)WBStatusOriginView *originView ;

@end

@implementation WBStatusDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES ;
        self.image = [UIImage imageResize:@"timeline_card_top_background"];
        
        WBStatusOriginView *originalView = [[WBStatusOriginView alloc]init] ;
        [self addSubview:originalView] ;
        self.originView =originalView ;
        
    }
    return self;
}

-(void)setDetailViewFrame:(WBStatusDetailFrame *)detailViewFrame{
    
    _detailViewFrame = detailViewFrame ;
    
    self.frame = detailViewFrame.frame ;
    
    _originView.orginViewFrame = detailViewFrame.statusOrginFrame ;
    
}



@end
