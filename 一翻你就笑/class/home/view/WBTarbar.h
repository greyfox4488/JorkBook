

#import <UIKit/UIKit.h>


@protocol WBTarbarDelegate <NSObject>

-(void)plusBtnOnCLick:(UIButton *)btn ;

@end

@interface WBTarbar : UITabBar

@property(nonatomic,weak)id<WBTarbarDelegate> delegate ;

@end
