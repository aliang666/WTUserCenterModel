//
//  WTUserInfoViewController.m
//  WTEmptyProject
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTUserInfoViewController.h"
#import "WTLoginInfo.h"
#import "WTLanguageCell.h"
#import "WTProfileInfoCell.h"
#import "WTProfilePhoneCell.h"
#import "WTExitLoginBtnCell.h"

@interface WTUserInfoViewController ()

@end

@implementation WTUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formManager[@"WTProfileInfoItem"] = @"WTProfileInfoCell";
    self.formManager[@"WTLanguageItem"] = @"WTLanguageCell";
    self.formManager[@"WTProfilePhoneItem"] = @"WTProfilePhoneCell";
    self.formManager[@"WTExitLoginBtnItem"] = @"WTExitLoginBtnCell";
    [self setControllerTitle];
    [self initFrom];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initFrom];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)setControllerTitle {
    self.navBar.title = [[WTLanguageUtil shareInstance] valueForKey:@"my_info_detail"];
}

- (void)initFrom {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    NSString *phoneNum = [WTUtil strRelay:[WTLoginInfo shareInstance].user.phoneNum];
    NSString *sex = [WTUtil strRelay:[WTLoginInfo shareInstance].user.sex];
    NSString *nick = [WTUtil strRelay:[WTLoginInfo shareInstance].user.nickname];
    NSString *email = [WTUtil strRelay:[WTLoginInfo shareInstance].user.email];
    NSString *birthday = [WTUtil strRelay:[WTLoginInfo shareInstance].user.birthday];
    NSString *address = [WTUtil strRelay:[WTLoginInfo shareInstance].user.address];
    
    // 个人信息
    WTProfileInfoItem *itHeader = [[WTProfileInfoItem alloc] init];
    itHeader.avtarIcon = sex;
    itHeader.nickName = nick;
    itHeader.mofifyHandler = ^(WTProfileInfoItem *item) {
        
    };
    [section0 addItem:itHeader];
    
    //手机
    WTProfilePhoneItem *itPhone = [[WTProfilePhoneItem alloc] init];
    if (![WTUtil strNilOrEmpty:phoneNum]) {
        itPhone.icon = @"icon_pheon";
        itPhone.titleText1 = [[WTLanguageUtil shareInstance] valueForKey:@"userinfo_phone"];
        itPhone.titleText2 = phoneNum;
    } else {
        itPhone.icon = @"ic_my_info_email";
        itPhone.titleText1 = [[WTLanguageUtil shareInstance] valueForKey:@"userinfo_email"];
        itPhone.titleText2 = email;
    }
    itPhone.hasArrow = YES;
    if (![WTLoginInfo isThird]) {
        [section0 addItem:itPhone];
    }
    
    //昵称
    WTProfilePhoneItem *itNickName = [[WTProfilePhoneItem alloc] init];
    itNickName.titleText1 = [[WTLanguageUtil shareInstance] valueForKey:@"userinfo_nickname"];
    itNickName.titleText2 = nick;
    itNickName.icon = @"ic_my_info_avtar";
    itNickName.hasArrow = YES;
    [section0 addItem:itNickName];
    
    //性别
    WTProfilePhoneItem *itSex = [[WTProfilePhoneItem alloc] init];
    itSex.titleText1 = [[WTLanguageUtil shareInstance] valueForKey:@"userinfo_sex"];
    itSex.titleText2 = sex;
    itSex.icon = @"profile_icon_xingbie";
    itSex.hasArrow = YES;
    [section0 addItem:itSex];
    
    //生日
    WTProfilePhoneItem *itBirthday = [[WTProfilePhoneItem alloc] init];
    itBirthday.titleText1 = [[WTLanguageUtil shareInstance] valueForKey:@"Birthday"];
    itBirthday.titleText2 = birthday;
    itBirthday.icon = @"profile_icon_nianling";
    itBirthday.hasArrow = YES;
    [section0 addItem:itBirthday];
    
    //地址
    WTProfilePhoneItem *itAddr = [[WTProfilePhoneItem alloc] init];
    itAddr.titleText1 = [[WTLanguageUtil shareInstance] valueForKey:@"userinfo_address"];
    itAddr.titleText2 = address;
    itAddr.icon = @"profile_icon_dizhi";
    itAddr.hasArrow = YES;
    [section0 addItem:itAddr];
    
    [section0 addItem:[WTEmptyItem initWithHeight:30]];
    
    //退出按钮
    WTExitLoginBtnItem *itExit = [[WTExitLoginBtnItem alloc] init];
    itExit.btnTitle = [[WTLanguageUtil shareInstance] valueForKey:@"my_login_login_out"];
    itExit.btnPress = ^{
        ;
    };
    [section0 addItem:itExit];
    
    [section0 addItem:[WTEmptyItem initWithHeight:30]];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}

@end
