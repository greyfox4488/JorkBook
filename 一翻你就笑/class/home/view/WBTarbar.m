

#import "WBTarbar.h"
#import "UIImage+Extension.h"

@interface WBTarbar()
@property(nonatomic,strong)UIButton *plusButton ;
@end

@implementation WBTarbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init{
    
    if(self= [super init]){
        self.backgroundColor = [UIColor whiteColor] ;
    }
    [self setupPlusButton];
    return self ;
}

-(void)layoutSubviews{

    [super layoutSubviews] ;
    
    [self layoutSubButton] ;
    
    [self layoutPlusButton] ;
    
  }

-(void)layoutSubButton{
    int fex = 0 ;
    CGFloat width = self.width /(self.items.count+1) ;
    for (UIView *test in self.subviews) {
        
    if (![test isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        test.x = width*fex ;
        test.y = 0 ;
        test.width = 50 ;
        test.height = 50 ;
        if (fex==1) {
            ++fex ;
        }
        fex ++ ;


    }
}

-(void)layoutPlusButton{
    
    self.plusButton.center =CGPointMake(self.width*0.5f, self.height*0.5f)
     ;
    self.plusButton.size = self.plusButton.currentBackgroundImage.size ;
    
}


-(void)setupPlusButton{
    UIButton *plusButton = [[UIButton alloc] init];
    // 设置背景
    [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    // 设置图标
    [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [plusButton addTarget:self action:@selector(plusClick:) forControlEvents:UIControlEventTouchUpInside];
    // 添加
    [self addSubview:plusButton];
    self.plusButton = plusButton;
}

-(void)plusClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(plusBtnOnCLick:)])
    {
        [self.delegate plusBtnOnCLick:btn] ;
    }
}

@end
