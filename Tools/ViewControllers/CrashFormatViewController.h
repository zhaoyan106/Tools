//
//  CrashFormatViewController.h
//  Tools
//
//  Created by Dawn on 14-4-16.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CrashFormatViewController : NSViewController{
@private
    IBOutlet NSTextView *crashFromTextView;
    IBOutlet NSTextView *crashToTextView;
    BOOL clickNum;
}

@end
