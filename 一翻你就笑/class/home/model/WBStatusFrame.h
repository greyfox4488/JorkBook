

#import <Foundation/Foundation.h>

@class FOXStatus,WBStatusDetailFrame ;

@interface WBStatusFrame : NSObject

@property(nonatomic,assign)CGRect toolBarFrame ;
@property(nonatomic,strong)WBStatusDetailFrame *detailViewFrame ;
@property(nonatomic,strong)FOXStatus *status;
@property(nonatomic,assign)CGFloat cellHeight ;

@end
