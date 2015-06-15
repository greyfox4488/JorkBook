
#import "WBStatusDetailFrame.h"
#import "WBStatusOraginFrame.h"
//#import "WBStatusReweetFrame.h"
#import "FOXStatus.h"

@implementation WBStatusDetailFrame

-(void)setStatus:(FOXStatus *)status{
    _status = status ;
    
    WBStatusOraginFrame *orginFrame = [[WBStatusOraginFrame alloc]init] ;
    orginFrame.status =status ;
    _statusOrginFrame = orginFrame ;
    self.frame = self.statusOrginFrame.frame ;
}



@end
