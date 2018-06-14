//
//  WTABountViewController.m
//  WTEmptyProject
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTABountViewController.h"
#import "WTLanguageCell.h"
#import "WTABoutHeadCell.h"
#import "WTMediator.h"
#import "CTMediator+WebViewModel.h"

@interface WTABountViewController ()

@end

@implementation WTABountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formManager[@"WTLanguageItem"] = @"WTLanguageCell";
    self.formManager[@"WTABoutHeadItem"] = @"WTABoutHeadCell";
    [self setControllerTitle];
    [self initFrom];
    
}

- (void)setControllerTitle {
    self.navBar.title = [[WTLanguageUtil shareInstance] valueForKey:@"my_main_about"];
}

- (void)initFrom {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    [section0 addItem:[[WTABoutHeadItem alloc] init]];

    //意见反馈
    WTLanguageItem *itLan = [[WTLanguageItem alloc] init];
    itLan.title = [WTUtil strRelay:[[WTLanguageUtil shareInstance] valueForKey:@"my_about_feedback"]];
    itLan.hasArrow = YES;
    itLan.selectionHandler = ^(id item) {
        NSString *path = @"H5Pages/translate-app/feedback.html";
        if ([[WTLanguageUtil shareInstance] getCurrentAppLanguage]==WTAppLanguage_EN) {
            path = @"H5Pages/translate-app/feedback-en.html";
        }
        NSString *titleT = [[WTLanguageUtil shareInstance] valueForKey:@"my_about_feedback"];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:path forKey:@"path"];
        [dic setObject:titleT forKey:@"title"];
        [[CTMediator sharedInstance] WebVC_Action:dic];
    };
    [section0 addItem:itLan];
    //售后服务
    WTLanguageItem *itService = [[WTLanguageItem alloc] init];
    itService.title = [WTUtil strRelay:[[WTLanguageUtil shareInstance] valueForKey:@"my_trans_machine_after_service"]];
    itService.hasArrow = YES;
    itService.selectionHandler = ^(id item) {
        NSString *path = @"H5Pages/translate-app/after-sale-service.html";
        if ([[WTLanguageUtil shareInstance] getCurrentAppLanguage]==WTAppLanguage_EN) {
            path = @"H5Pages/translate-app/after-sale-service-en.html";
        }
        NSString *titleT = [[WTLanguageUtil shareInstance] valueForKey:@"xy_afterSale"];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:path forKey:@"path"];
        [dic setObject:titleT forKey:@"title"];
        [[CTMediator sharedInstance] WebVC_Action:dic];
    };
    [section0 addItem:itService];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}

@end
