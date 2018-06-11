//
//  WTExitLoginBtnCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTExitLoginBtnCell.h"
#import "WTDefine.h"
#import "WTUtil.h"
@implementation WTExitLoginBtnItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 45;
         self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface WTExitLoginBtnCell()
{
     UIButton *btn;
}
@end

@implementation WTExitLoginBtnCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
     
     btn = [[UIButton alloc] initWithFrame:CGRectMake(15, 0, WTScreenWidth-15-15, 45)];
     [btn setBackgroundImage:[UIImage imageNamed:@"red_bgImage"] forState:UIControlStateNormal];
     [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
     [self.contentView addSubview:btn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
     [btn setTitle:[WTUtil strRelay:self.item.btnTitle] forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)btnPressed:(UIButton *)b {
     if (self.item.btnPress) {
          self.item.btnPress();
     }
}
@end
