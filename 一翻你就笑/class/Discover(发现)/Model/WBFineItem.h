
#import <UIKit/UIKit.h>

@interface WBFineItem : UIImageView

@property(nonatomic,strong)NSString *title ;
@property(nonatomic,strong)NSString *Subtitle ;
@property(nonatomic,strong)NSString *icon ;
@property(nonatomic,strong)NSString *bageValue ;
@property(nonatomic,strong)void(^action)() ;

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title ;


@end
