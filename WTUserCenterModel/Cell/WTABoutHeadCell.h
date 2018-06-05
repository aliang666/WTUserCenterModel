//
//  WTABoutHeadCell.h
//  IFXY
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 IFly. All rights reserved.
//
#import "WTBaseCell.h"

@interface WTABoutHeadItem : WTBaseItem
@property (nonatomic,copy) NSString *iconUrl;
@end

@interface WTABoutHeadCell : WTBaseCell
@property (strong, readwrite, nonatomic) WTABoutHeadItem *item;
@end
