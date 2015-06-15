

#import <Foundation/Foundation.h>

@class FOXUser;

@interface FOXStatus : NSObject<NSCoding>

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *wuid;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, strong) NSString *gif_cover;

@property (nonatomic, strong) NSString *time;

@property (nonatomic, strong) NSString *reposts_count;

@property (nonatomic, strong) NSString *comments_count;

@property (nonatomic, strong) NSString *like_count;
@property (nonatomic, strong) NSString *pic_width;
@property (nonatomic, strong) NSString *pic_height;

@property (nonatomic, strong) NSString *cai_count;
@property (nonatomic, strong) NSString *pic_urls;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *hot;
@property (nonatomic, strong) NSString *mark;
@property (nonatomic, strong) NSString *comments;
@property (nonatomic, strong) NSString *gif_flag;


@end
