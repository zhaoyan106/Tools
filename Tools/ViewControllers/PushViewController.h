//
//  PushViewController.h
//  Tools
//
//  Created by Dawn on 14-6-6.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface PushViewController : NSViewController{
@private
    IBOutlet NSTextField *ipTextField;
    IBOutlet NSTextField *tokenTextField;
    IBOutlet NSTextField *urlTextField;
    IBOutlet NSTextField *contentTextField;
    IBOutlet NSComboBox *pushTypeComboBox;
    IBOutlet NSTextView *textView;
    int count;
}

@end

@interface PushMessage : NSObject
@property (nonatomic,strong) NSString *ip;
@property (nonatomic,strong) NSString *token;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,assign) NSInteger pushType;
@end
