
#import "WBFineGroup.h"

@implementation WBFineGroup

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(instancetype)group {
    WBFineGroup *g = [[WBFineGroup alloc]init] ;
    return g ;
}

@end
