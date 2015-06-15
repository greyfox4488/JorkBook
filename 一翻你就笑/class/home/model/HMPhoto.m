

#import "HMPhoto.h"

@implementation HMPhoto

-(void)setThumbnail_pic:(NSString *)thumbnail_pic{
    _thumbnail_pic = [thumbnail_pic copy];
    
    _middle_pic = [thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"] ;
}

@end
