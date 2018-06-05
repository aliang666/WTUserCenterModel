//
//  WTABoutHeadCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTABoutHeadCell.h"
#import "WTDefine.h"
#import "UIView+Additions.h"

@implementation WTABoutHeadItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 150;
         self.hasBottomLine = NO;
         self.iconUrl = @"app_icon";
    }
    return self;
}

@end

@interface WTABoutHeadCell()
{
     UIImageView *iconImg;
     UILabel *appNameLab;
     UILabel *appVersionLab;
}
@end

@implementation WTABoutHeadCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
     self.contentView.backgroundColor = [UIColor clearColor];

     iconImg = [[UIImageView alloc] initWithFrame:CGRectMake((WTScreenWidth-60)/2, 20, 60, 60)];
     [self.contentView addSubview:iconImg];
     
     appNameLab = [[UILabel alloc] initWithFrame:CGRectMake(20, iconImg.bottom+15, WTScreenWidth-20-20, 15)];
     appNameLab.font = WTFontSys(15);
     appNameLab.textColor = WT_APPColor_TextColor;
     appNameLab.textAlignment = NSTextAlignmentCenter;
     appNameLab.text = [[WTLanguageUtil shareInstance] valueWithKeyWithKey:@"app_name_sure"];
     [self.contentView addSubview:appNameLab];
     
     appVersionLab = [[UILabel alloc] initWithFrame:CGRectMake(20, appNameLab.bottom+5, WTScreenWidth-20-20, 15)];
     appVersionLab.font = WTFontSys(15);
     appVersionLab.textColor = WT_APPColor_TextColor;
     appVersionLab.textAlignment = NSTextAlignmentCenter;
     appVersionLab.text = [WTUtil strRelay:[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]];
     [self.contentView addSubview:appVersionLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
     [iconImg setImage:[UIImage imageNamed:self.item.iconUrl]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
