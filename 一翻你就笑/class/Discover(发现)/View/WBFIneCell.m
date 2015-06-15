
#import "WBFIneCell.h"
#import "WBFineItem.h"
#import "UIImage+Extension.h"
#import "WBFineItemArrow.h"
#import "WBFineItemSwich.h"
#import "WBFineItemLabel.h"

#define BaneVlaueFontSize 15
#define BaneVlaueWidth 25

@interface WBFIneCell()

@property(nonatomic,strong)UIImageView *bgView ;
@property(nonatomic,strong)UIImageView *selectView ;
@property(nonatomic,strong)UILabel *itemLabel ;
@property(nonatomic,strong)UIImageView *itemArrow ;
@property(nonatomic,strong)UISwitch *itemSwich ;
@property(nonatomic,strong)UIButton *bageView ;

@end
@implementation WBFIneCell

+(instancetype)cellWithTableVIew:(UITableView *)tableview {

    static NSString *inde = @"test" ;
    WBFIneCell *cell = [tableview dequeueReusableCellWithIdentifier:inde];
    if (cell==nil) {
        cell = [[WBFIneCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:inde] ;
        cell.backgroundColor = [UIColor clearColor] ;
    }
    
    return cell ;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.bgView = [[UIImageView alloc]init] ;
        self.selectView = [[UIImageView alloc]init] ;
        self.itemLabel = [[UILabel alloc]init] ;
        self.itemLabel.font = [UIFont systemFontOfSize:BaneVlaueFontSize] ;
        self.itemArrow = [[UIImageView alloc]init] ;
        self.itemSwich = [[UISwitch alloc]init] ;
        
        UIButton *btn = [[UIButton alloc]init] ;
        btn.size = CGSizeMake(BaneVlaueWidth, BaneVlaueWidth) ;

        [btn setBackgroundImage:[UIImage imageResize:@"main_badge"] forState:UIControlStateNormal] ;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:BaneVlaueFontSize]] ;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] ;
        self.bageView =btn ;
    }
    return self;
}

-(void)setItem:(WBFineItem *)item{
    self.textLabel.text = item.title ;
    self.imageView.image = [UIImage imageNamed:item.icon] ;
    self.detailTextLabel.text = item.Subtitle ;
    if (item.bageValue) {
        CGSize bageSize = [item.bageValue sizeWithFont:[UIFont systemFontOfSize:15]] ;
        if (bageSize.width>BaneVlaueWidth) {
            self.bageView.size = CGSizeMake(bageSize.width+8, BaneVlaueWidth) ;
        }
        [self.bageView setTitle:item.bageValue forState:UIControlStateNormal] ;
        self.accessoryView = self.bageView ;
        
    }else if ([item isKindOfClass:[WBFineItemLabel class]]) {
        self.itemLabel.text = item.title ;
        self.itemLabel.size = [item.title sizeWithFont:self.itemLabel.font] ;
        self.accessoryView = self.itemLabel ;
        
    }else if ([item isKindOfClass:[WBFineItemArrow class]]){
        self.accessoryView = self.itemArrow ;
    }else if ([item isKindOfClass:[WBFineItemSwich class]]){
        self.accessoryView = self.itemSwich;
    }else{
        self.accessoryView = nil ;
    }
    
}

-(void)setFrame:(CGRect)frame{
    frame.origin.y = frame.origin.y-StatusCellMargin-15;
    [super setFrame:frame] ;
    
}

-(void)setBackImgWithIndexPath:(NSIndexPath *)indexPath totalCount:(int)rows{

    // 2.设置背景图片
    if (rows == 1) {
        self.bgView.image = [UIImage imageResize:@"common_card_background"];
        self.selectView.image = [UIImage imageResize:@"common_card_background_highlighted"];
    } else if (indexPath.row == 0) { // 首行
        self.bgView.image = [UIImage imageResize:@"common_card_top_background"];
        self.selectView.image = [UIImage imageResize:@"common_card_top_background_highlighted"];
    } else if (indexPath.row == rows - 1) { // 末行
        self.bgView.image = [UIImage imageResize:@"common_card_bottom_background"];
        self.selectView.image = [UIImage imageResize:@"common_card_bottom_background_highlighted"];
    } else { // 中间
        self.bgView.image = [UIImage imageResize:@"common_card_middle_background"];
        self.selectView.image = [UIImage imageResize:@"common_card_middle_background_highlighted"];
    }
    
    self.backgroundView = self.bgView ;
}

@end
