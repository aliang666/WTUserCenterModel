//
//  WTLanguageViewController.m
//  WTEmptyProject
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTLanguageViewController.h"
#import "WTLanguageCell.h"
@interface WTLanguageViewController ()

@end

@implementation WTLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formManager[@"WTLanguageItem"] = @"WTLanguageCell";
    [self setControllerTitle];
    [self initFrom];
}

- (void)setControllerTitle {
    self.navBar.title = [[WTLanguageUtil shareInstance] valueForKey:@"my_main_language"];
}

- (void)initFrom {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    WTAppLanguageType type = [[WTLanguageUtil shareInstance] getCurrentAppLanguage];

    WTLanguageItem *itGN = [[WTLanguageItem alloc] init];
    itGN.title = @"简体中文";
    if (type==WTAppLanguage_CN) {
        itGN.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    itGN.selectionHandler = ^(id item) {
        [[WTLanguageUtil shareInstance] setCurrentAppLanguage:WTAppLanguage_CN];
        [bself setControllerTitle];
        [bself initFrom];
    };
    [section0 addItem:itGN];

    WTLanguageItem *itLan = [[WTLanguageItem alloc] init];
    itLan.title = @"English";
    if (type==WTAppLanguage_EN) {
        itLan.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    itLan.selectionHandler = ^(id item) {
        [[WTLanguageUtil shareInstance] setCurrentAppLanguage:WTAppLanguage_EN];
        [bself setControllerTitle];
        [bself initFrom];
    };
    [section0 addItem:itLan];
    
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}

@end
