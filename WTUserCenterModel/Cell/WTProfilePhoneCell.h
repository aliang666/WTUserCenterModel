//
//  WTProfilePhoneCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTBaseCell.h"

@interface WTProfilePhoneItem : WTBaseItem
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *titleText1;
@property (nonatomic,copy) NSString *titleText2;
@end

@interface WTProfilePhoneCell : WTBaseCell
@property (strong, readwrite, nonatomic) WTProfilePhoneItem *item;
@end
