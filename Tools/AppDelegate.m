//
//  AppDelegate.m
//  Tools
//
//  Created by Dawn on 14-3-24.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    rootVC = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    
    [self.window setContentView:rootVC.view];
}


- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}

@end
