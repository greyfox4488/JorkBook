
#import "WBFineItem.h"

@implementation WBFineItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    
    WBFineItem *item = [[self alloc]init] ;
    item.title = title ;
    item.icon = icon ;

    return item ;
}

@end
