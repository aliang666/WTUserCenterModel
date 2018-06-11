//
//  WTExitLoginBtnCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTBaseCell.h"

@interface WTExitLoginBtnItem : WTBaseItem
@property (copy,nonatomic) NSString *btnTitle;
@property (copy, readwrite, nonatomic) void (^btnPress)(void);
@end

@interface WTExitLoginBtnCell : WTBaseCell
@property (strong, readwrite, nonatomic) WTExitLoginBtnItem *item;
@end
