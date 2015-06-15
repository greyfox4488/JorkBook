

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"

@implementation UIBarButtonItem (WBBarBtnItem)

+(UIBarButtonItem *)itemWithNorImgName:(NSString *)norImgName highligntName:(NSString *)highlightName target:(id)target action:(SEL)action{
    
    UIButton *searchBtn = [[UIButton alloc]init] ;
    [searchBtn setBackgroundImage:[UIImage imageNamed:norImgName] forState:UIControlStateNormal] ;
    
    [searchBtn setBackgroundImage:[UIImage imageNamed:highlightName] forState:UIControlStateHighlighted] ;
    
    searchBtn.size = searchBtn.currentBackgroundImage.size ;
    
    [searchBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside] ;

    return [[UIBarButtonItem alloc]initWithCustomView:searchBtn] ;
}


@end
