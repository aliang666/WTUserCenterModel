//
//  WTUserCenterViewController.m
//  WTEmptyProject
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTUserCenterViewController.h"
#import "WTProfileCell.h"
#import "WTLoginInfo.h"
@interface WTUserCenterViewController ()

@end

@implementation WTUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.leftItemList = [NSArray array];
    self.formManager[@"WTProfileItem"] = @"WTProfileCell";
    [self setControllerTitle];
    [self initFrom];
}

- (void)setControllerTitle {
    self.navBar.title = [[WTLanguageUtil shareInstance] valueForKey:@"user_title"];
}

- (void)initFrom {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    [section0 addItem:[WTEmptyItem initWithHeight:30]];
    
    //个人信息
    WTProfileItem *itHeader = [[WTProfileItem alloc] init];
    itHeader.sex = [WTUtil strRelay:[WTLoginInfo shareInstance].user.sex];
    itHeader.nickName = [WTUtil strRelay:[WTLoginInfo shareInstance].user.nickname];
    itHeader.phoneNumber = [WTUtil strRelay:[WTLoginInfo shareInstance].user.phoneNum];
    itHeader.email = [WTUtil strRelay:[WTLoginInfo shareInstance].user.email];
    itHeader.notice = [[WTLanguageUtil shareInstance] valueForKey:@"tab_my_notice"];
    itHeader.selectionHandler = ^(id item) {
    };
    [section0 addItem:itHeader];
    
    [section0 addItem:[WTEmptyItem initWithHeight:30]];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
