

#import "WBStatusTableCell.h"
#import "WBStatusDetailView.h"
#import "WBStatusToolbarView.h"
#import "WBStatusFrame.h"
#import "WBStatusDetailFrame.h"

@interface WBStatusTableCell()

@property(nonatomic,strong)WBStatusDetailView *detailVIew ;
@property(nonatomic,strong)WBStatusToolbarView *toolBarVIew ;

@end

@implementation WBStatusTableCell


+(instancetype) cellWithTable:(UITableView *)tableView {
    
    static NSString *ind = @"test" ;
    WBStatusTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ind];
    
    if (cell==nil) {
        cell = [[WBStatusTableCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ind] ;
        cell.backgroundColor = [UIColor clearColor] ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone ;

    }
    
    return cell ;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [(UIView*)[self.contentView.subviews lastObject] removeFromSuperview];
        [self setupDetailView] ;
        [self setupToolbarView] ;
    }
    
    return self;
}

-(void)setStatusFrame:(WBStatusFrame *)statusFrame{
    
    _statusFrame = statusFrame ;

    self.detailVIew.detailViewFrame =statusFrame.detailViewFrame ;
    self.toolBarVIew.frame = statusFrame.toolBarFrame ;
    self.toolBarVIew.status = statusFrame.status ;
}


-(void)setupDetailView{
    WBStatusDetailView *detailView = [[WBStatusDetailView alloc]init] ;
    [self.contentView addSubview:detailView] ;
    self.detailVIew = detailView ;
}

-(void)setupToolbarView{
    
    if (_toolBarVIew==nil) {
        WBStatusToolbarView *toolBarView = [[WBStatusToolbarView alloc]init] ;
        [self.contentView addSubview:toolBarView] ;
        self.toolBarVIew = toolBarView ;
    }else{
        [_toolBarVIew removeFromSuperview] ;
    }
    
}

@end
