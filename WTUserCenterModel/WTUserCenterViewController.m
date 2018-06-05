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
#import "WTLanguageCell.h"

@interface WTUserCenterViewController ()

@end

@implementation WTUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.leftItemList = [NSArray array];
    self.formManager[@"WTProfileItem"] = @"WTProfileCell";
    self.formManager[@"WTLanguageItem"] = @"WTLanguageCell";
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
    
    //功能设置
    WTLanguageItem *itGN = [[WTLanguageItem alloc] init];
    itGN.title = [WTUtil strRelay:[[WTLanguageUtil shareInstance] valueForKey:@"my_main_play_set"]];
    itGN.hasArrow = YES;
    itGN.image = [UIImage imageNamed:@"profile_setting"];
    [section0 addItem:itGN];
    
    //语言设置
    WTLanguageItem *itLan = [[WTLanguageItem alloc] init];
    itLan.title = [WTUtil strRelay:[[WTLanguageUtil shareInstance] valueForKey:@"my_main_language"]];
    itLan.hasArrow = YES;
    itLan.image = [UIImage imageNamed:@"profile_lag"];
    [section0 addItem:itLan];
    
    [section0 addItem:[WTEmptyItem initWithHeight:30]];
    
    //关于我们
    WTLanguageItem *itABout = [[WTLanguageItem alloc] init];
    itABout.title = [WTUtil strRelay:[[WTLanguageUtil shareInstance] valueForKey:@"my_main_about"]];
    itABout.hasArrow = YES;
    itABout.image = [UIImage imageNamed:@"profile_about"];
    [section0 addItem:itABout];
        
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
