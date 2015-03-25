//
//  RootViewController.h
//  Tools
//
//  Created by Dawn on 14-3-24.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DateViewController.h"
#import "UrlCodingViewController.h"
#import "JSONFormatViewController.h"
#import "UnicodeViewController.h"
#import "CrashFormatViewController.h"
#import "PushViewController.h"

@interface RootViewController : NSViewController{
@private
    DateViewController *dateViewController;
    UrlCodingViewController *urlCodingVC;
    JSONFormatViewController *jsonFormatVC;
    UnicodeViewController *unicodeVC;
    CrashFormatViewController *crashFormatVC;
    PushViewController *pushVC;
    NSTabView *tabView;
}

@end
