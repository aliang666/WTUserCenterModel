//
//  WTLanguageCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTProfilePhoneCell.h"
#import "WTDefine.h"
#import "WTUtil.h"
#import "UIView+Additions.h"
#import "IFXY-Swift.h"
#import "WTEnum.h"
@implementation WTProfilePhoneItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 48;
    }
    return self;
}

@end

@interface WTProfilePhoneCell()
{
     UIImageView *iconImg;
     UILabel *titleLab1;
     UILabel *titleLab2;
}
@end

@implementation WTProfilePhoneCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
     iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, (48-22)/2, 21, 22)];
     iconImg.contentMode = UIViewContentModeScaleAspectFit;
     [self.contentView addSubview:iconImg];
     
     titleLab1 = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+15, iconImg.top, 80, iconImg.height)];
     titleLab1.font = WTFontSys(16);
     titleLab1.textColor = WT_APPColor_TextColor;
     [self.contentView addSubview:titleLab1];
     
     titleLab2 = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+15, iconImg.top, WTScreenWidth-iconImg.right-15-22, iconImg.height)];
     titleLab2.font = WTFontSys(16);
     titleLab2.textColor = WTColorHex(0x1e1e1e);
     [self.contentView addSubview:titleLab2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
     [iconImg setImage:[UIImage imageNamed:[WTUtil strRelay:self.item.icon]]];
     titleLab1.text = [WTUtil strRelay:self.item.titleText1];
     titleLab2.text = [WTUtil strRelay:self.item.titleText2];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
     NSString *languege = [[WTLanguageUtil shareInstance] getCurrentLanguage];
     titleLab1.width = 50;
     if ([languege isEqualToString:WT_Language_English]) {
          titleLab1.width = 80;
     }
     titleLab2.left = titleLab1.right+5;
     titleLab2.width = WTScreenWidth-titleLab2.left-22;
}

@end
