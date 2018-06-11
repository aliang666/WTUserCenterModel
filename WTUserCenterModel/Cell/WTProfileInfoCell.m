//
//  WTProfileInfoCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTProfileInfoCell.h"
#import "WTBaseCore.h"
#import "WTLoginInfo.h"

@implementation WTProfileInfoItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 250;
    }
    return self;
}

@end

@interface WTProfileInfoCell()
{
     UIImageView *imgView;
     UILabel *nickNameLab;
     UIButton *modifyBtn;
}
@end

@implementation WTProfileInfoCell

- (void)cellDidLoad
{
    [super cellDidLoad];
     self.backgroundColor = WT_Color_BlueColor;
     imgView = [[UIImageView alloc] initWithFrame:CGRectMake((WTScreenWidth-90)/2, 15, 90, 90)];
     imgView.layer.cornerRadius = 3;
     imgView.layer.masksToBounds = YES;
     [self.contentView addSubview:imgView];
     
     nickNameLab = [[UILabel alloc] initWithFrame:CGRectMake(12, imgView.bottom+15, WTScreenWidth-12-12, 30)];
     nickNameLab.textAlignment = NSTextAlignmentCenter;
     nickNameLab.textColor = [UIColor whiteColor];
     [self.contentView addSubview:nickNameLab];
     
     modifyBtn = [[UIButton alloc] initWithFrame:CGRectMake((WTScreenWidth-160)/2, nickNameLab.bottom+15, 160, 30)];
     [modifyBtn setTitle:[[WTLanguageUtil shareInstance] valueForKey:@"my_info_change_password"] forState:UIControlStateNormal];
     modifyBtn.titleLabel.font = WTFontSys(15);
     modifyBtn.layer.cornerRadius = 15;
     modifyBtn.clipsToBounds = YES;
     modifyBtn.layer.borderColor = [UIColor whiteColor].CGColor;
     modifyBtn.layer.borderWidth = 1;
     [modifyBtn addTarget:self action:@selector(modifyPress) forControlEvents:UIControlEventTouchUpInside];
     [self.contentView addSubview:modifyBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
     NSString *sex = [WTUtil strRelay:self.item.avtarIcon];
     [imgView setImage:[UIImage imageNamed:@"profile_avtar_default"]];
     if ([sex isEqualToString:@"男"]||[sex isEqualToString:@"Male"]) {
          [imgView setImage:[UIImage imageNamed:@"male"]];
     } else if ([sex isEqualToString:@"女"]||[sex isEqualToString:@"Female"]) {
          [imgView setImage:[UIImage imageNamed:@"female"]];
     }
     nickNameLab.text = [WTUtil strRelay:self.item.nickName];
     
     modifyBtn.hidden = NO;
     if ([WTLoginInfo isThird]) {
          modifyBtn.hidden = YES;
     }
}

- (void)modifyPress {
     if (self.item.mofifyHandler) {
          self.item.mofifyHandler(nil);
     }
}
@end
