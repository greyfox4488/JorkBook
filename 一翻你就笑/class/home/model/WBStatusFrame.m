

#import "WBStatusFrame.h"
#import "WBStatusOraginFrame.h"
#import "FOXStatus.h"
#import "WBStatusDetailFrame.h"
#import "WBStatusToolbarView.h"

@implementation WBStatusFrame

-(void)setStatus:(FOXStatus *)status{
    _status = status ;
    
    WBStatusDetailFrame *detailFrame = [[WBStatusDetailFrame alloc]init] ;
    detailFrame.status = status ;
    _detailViewFrame = detailFrame ;
    self.toolBarFrame = CGRectMake(StatusCellMargin*2, CGRectGetMaxY(detailFrame.frame), StandardWidth-StatusCellMargin*4, 35) ;
     
}

-(CGFloat)cellHeight{
    
    return CGRectGetMaxY(self.toolBarFrame) + StatusCellMargin ;
}

@end
