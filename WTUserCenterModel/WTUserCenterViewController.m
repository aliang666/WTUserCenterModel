//
//  WTUserCenterViewController.m
//  WTEmptyProject
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTUserCenterViewController.h"

@interface WTUserCenterViewController ()

@end

@implementation WTUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.leftItemList = [NSArray array];
    
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
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
