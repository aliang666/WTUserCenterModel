//
//  WTProfileCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTBaseCell.h"

@interface WTProfileItem : WTBaseItem
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,copy) NSString *phoneNumber;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,copy) NSString *notice;
@end

@interface WTProfileCell : WTBaseCell
@property (strong, readwrite, nonatomic) WTProfileItem *item;
@end
