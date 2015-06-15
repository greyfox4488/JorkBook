

#import <Foundation/Foundation.h>

@class WBStatusOraginFrame,WBStatusReweetFrame ,FOXStatus;
@interface WBStatusDetailFrame : NSObject

@property(nonatomic,strong)WBStatusOraginFrame *statusOrginFrame;
@property(nonatomic,strong)WBStatusReweetFrame *statusReweetFrame;
@property(nonatomic,assign)CGRect frame ;
@property(nonatomic,strong)FOXStatus *status ;

@end
