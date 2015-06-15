

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}


+ (UIImage *)imageResize:(NSString *)name{
    UIImage *img = [UIImage imageNamed:name] ;
    return [img stretchableImageWithLeftCapWidth:img.size.width*.5 topCapHeight:img.size.height*.5] ;
}

@end
