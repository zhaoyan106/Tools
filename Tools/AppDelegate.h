//
//  AppDelegate.h
//  Tools
//
//  Created by Dawn on 14-3-24.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RootViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    RootViewController *rootVC;
}

@property (assign) IBOutlet NSWindow *window;

@end
