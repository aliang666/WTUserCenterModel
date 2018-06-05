//
//  WTProfileCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTProfileCell.h"
#import "WTDefine.h"
#import "WTUtil.h"
#import "IFXY-Swift.h"
@implementation WTProfileItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 80;
         self.hasArrow = YES;
    }
    return self;
}

@end

@interface WTProfileCell()
{
     UIImageView *imgView;
     UILabel *nickNameLab;
     UILabel *phoneNumLab;
     UILabel *noticeLab;
}
@end

@implementation WTProfileCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
     imgView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 60, 60)];
     imgView.layer.cornerRadius = 3;
     imgView.layer.masksToBounds = YES;
     [self.contentView addSubview:imgView];
     
     nickNameLab = [[UILabel alloc] initWithFrame:CGRectMake(imgView.right+12, imgView.top+7, WTScreenWidth-imgView.right-12-22, 20)];
     nickNameLab.textColor = WT_APPColor_TextColor;
     [self.contentView addSubview:nickNameLab];
     
     phoneNumLab = [[UILabel alloc] initWithFrame:CGRectMake(nickNameLab.left, nickNameLab.bottom+6, nickNameLab.width, 20)];
     phoneNumLab.textColor = WT_APPColor_TextColor;
     [self.contentView addSubview:phoneNumLab];
     
     noticeLab = [[UILabel alloc] initWithFrame:phoneNumLab.frame];
     noticeLab.font = WTFontSys(15);
     noticeLab.textColor = WT_APPColor_TextGrayColor;
     [self.contentView addSubview:noticeLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
     NSString *sex = [WTUtil strRelay:self.item.sex];
     [imgView setImage:[UIImage imageNamed:@"profile_avtar_default"]];
     if ([sex isEqualToString:@"男"]||[sex isEqualToString:@"Male"]) {
          [imgView setImage:[UIImage imageNamed:@"male"]];
     } else if ([sex isEqualToString:@"女"]||[sex isEqualToString:@"Female"]) {
          [imgView setImage:[UIImage imageNamed:@"female"]];
     }
     nickNameLab.text = [WTUtil strRelay:self.item.nickName];
     if (![WTUtil strNilOrEmpty:self.item.phoneNumber]) {
          phoneNumLab.text = [WTUtil toXingPhone:[WTUtil strRelay:self.item.phoneNumber]];
     } else {
          phoneNumLab.text = [WTUtil strRelay:self.item.email];
     }
     noticeLab.hidden = YES;
     if ([UserAccountTool shareIntance].isThird) {
          noticeLab.hidden = NO;
     }
     noticeLab.text = [WTUtil strRelay:self.item.notice];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
