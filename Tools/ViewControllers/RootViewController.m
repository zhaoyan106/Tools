//
//  RootViewController.m
//  Tools
//
//  Created by Dawn on 14-3-24.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()


@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void) loadView{
    [super loadView];
    
    tabView = [[NSTabView alloc] initWithFrame:CGRectMake(10, 20,100, 200)];
    
    
    
    // 日期格式化
    dateViewController = [[DateViewController alloc] initWithNibName:@"DateViewController" bundle:nil];
    NSTabViewItem *dateTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"DateTabItem"];
    [dateTabItem setToolTip:@"Date Format"];
    [dateTabItem setView:dateViewController.view];
    [dateTabItem setLabel:@"Date Format"];
    [tabView addTabViewItem:dateTabItem];

    // Url编码解码
    urlCodingVC = [[UrlCodingViewController alloc] initWithNibName:@"UrlCodingViewController" bundle:nil];
    NSTabViewItem *urlCodingTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"UrlCodingTabItem"];
    [urlCodingTabItem setToolTip:@"Url Encoding & Decoding"];
    [urlCodingTabItem setView:urlCodingVC.view];
    [urlCodingTabItem setLabel:@"Url Encoding & Decoding"];
    [tabView addTabViewItem:urlCodingTabItem];
    
    // Unicode编码解码
    unicodeVC = [[UnicodeViewController alloc] initWithNibName:@"UnicodeViewController" bundle:nil];
    NSTabViewItem *unicodeTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"UnicodeTabItem"];
    [unicodeTabItem setToolTip:@"Unicode Encoding & Decoding"];
    [unicodeTabItem setView:unicodeVC.view];
    [unicodeTabItem setLabel:@"Unicode Encoding & Decoding"];
    [tabView addTabViewItem:unicodeTabItem];
    
    // JSON 格式化
    jsonFormatVC = [[JSONFormatViewController alloc] initWithNibName:@"JSONFormatViewController" bundle:nil];
    NSTabViewItem *jsonFormatTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"JSONFormatTabItem"];
    [jsonFormatTabItem setToolTip:@"JSON Format"];
    [jsonFormatTabItem setView:jsonFormatVC.view];
    [jsonFormatTabItem setLabel:@"JSON Format"];
    [tabView addTabViewItem:jsonFormatTabItem];
    
    // Crash 格式化
    crashFormatVC = [[CrashFormatViewController alloc] initWithNibName:@"CrashFormatViewController" bundle:nil];
    NSTabViewItem *crashFormatTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"CrashFormatTabItem"];
    [crashFormatTabItem setToolTip:@"Crash Format"];
    [crashFormatTabItem setView:crashFormatVC.view];
    [crashFormatTabItem setLabel:@"Crash Format"];
    [tabView addTabViewItem:crashFormatTabItem];
    
    // 推送
    pushVC = [[PushViewController alloc] initWithNibName:@"PushViewController" bundle:nil];
    NSTabViewItem *pushTabItem = [[NSTabViewItem alloc] initWithIdentifier:@"PushTabItem"];
    [pushTabItem setToolTip:@"Push"];
    [pushTabItem setView:pushVC.view];
    [pushTabItem setLabel:@"Push"];
    [tabView addTabViewItem:pushTabItem];
    
    
    
    [self.view addSubview:tabView];
    
    // 增加约束
    [tabView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[tabView]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self.view,tabView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[tabView]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self.view,tabView)]];
}
@end
