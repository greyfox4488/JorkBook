

#import "WBStatusOraginFrame.h"
#import "FOXStatus.h"
//#import "WBStatusPhotosView.h"

#define CELL_CONTENT_WIDTH StandardWidth-StatusCellMargin*8

@implementation WBStatusOraginFrame

-(void)setStatus:(FOXStatus *)status{
    
    _status= status ;
    
    //计算昵称frame
    CGFloat nameX = StatusCellMargin*2 ;
    CGFloat nameY = StatusCellMargin ;
    CGSize constrainedSize = CGSizeMake(MAXFLOAT, 14) ;
    CGSize nameSize = [self.status.nick sizeWithFont:StatusUserNameFont constrainedToSize:constrainedSize] ;
    self.userNameFrame = (CGRect){nameX,nameY,nameSize} ;
    
    //计算正文frame
    CGFloat textX = StatusCellMargin*2 ;
    CGFloat textY = CGRectGetMaxY(self.userNameFrame)+StatusCellMargin ;
    CGSize textConstrainedSize = CGSizeMake(StandardWidth-StatusCellMargin*8, MAXFLOAT) ;
//    NSDictionary *attribute = @{NSFontAttributeName: StatusMainTextFont};
    
   CGSize textSize = [status.content sizeWithFont:StatusMainTextFont constrainedToSize:textConstrainedSize] ;
    
    self.textViewFrame = (CGRect){textX,textY,textSize.width,textSize.height+StatusCellMargin*2} ;
    
    //计算正文图片
    int picX = StatusCellMargin*2 ;
    int picY = CGRectGetMaxY(self.textViewFrame)+StatusCellMargin*2 ;
    int picW = 0 ;
    int picH = 0 ;

    if (status.pic_width.intValue>CELL_CONTENT_WIDTH) {
        picW = CELL_CONTENT_WIDTH ;
        float scaleF =picW/status.pic_width.floatValue ;
        picH =status.pic_height.intValue*scaleF ;
    }else{
        picW = status.pic_width.intValue ;
        picH = status.pic_height.intValue ;
    }

    
    self.contentPicFrame = CGRectMake(picX, picY, picW, picH) ;
    
    
//    if (status.pic_url) {
//        int photoX = StatusCellMargin ;
//        int photoY = CGRectGetMaxY(self.textViewFrame)+StatusCellMargin ;
//        CGSize photoSize = [WBStatusPhotosView sizeWithPhotoCount:status.pic_urls.count] ;
//        self.photoFrame = (CGRect){{photoX,photoY},photoSize} ;
//    }else{
//        self.photoFrame = CGRectZero ;
//    }
    
}




-(CGRect)frame{
    int orginX = StatusCellMargin ;
    int orginY = StatusCellMargin ;
    int orginW = StandardWidth-StatusCellMargin*4 ;
    int orginH = 0 ;
    
//    if (self.status.pic_urls.count>0) {
//        orginH= CGRectGetMaxY(self.photoFrame)+StatusCellMargin ;
//    }else{
        orginH= CGRectGetMaxY(self.contentPicFrame)+StatusCellMargin;
//    }
    
    return CGRectMake(orginX, orginY, orginW, orginH) ;
}

@end
