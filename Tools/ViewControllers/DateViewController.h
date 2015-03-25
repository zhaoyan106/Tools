//
//  DateViewController.h
//  Tools
//
//  Created by Dawn on 14-3-24.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DateViewController : NSViewController{
@private
    IBOutlet NSTextField *dateFromTextField;
    IBOutlet NSTextField *dateToTextField;
    IBOutlet NSButton *json2NormalBtn;
    IBOutlet NSButton *normal2JSONBtn;
}

@end
