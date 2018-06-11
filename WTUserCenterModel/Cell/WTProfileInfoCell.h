//
//  WTProfileInfoCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTBaseCell.h"

@interface WTProfileInfoItem : WTBaseItem
@property (nonatomic,copy) NSString *avtarIcon;
@property (nonatomic,copy) NSString *nickName;
@property (copy, readwrite, nonatomic) void (^mofifyHandler)(id item);
@end

@interface WTProfileInfoCell : WTBaseCell
@property (strong, readwrite, nonatomic) WTProfileInfoItem *item;
@end
