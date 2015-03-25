//
//  JSONFormatViewController.h
//  Tools
//
//  Created by Dawn on 14-3-25.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JSONItem : NSObject
@property (nonatomic,strong) NSString *key;
@property (nonatomic,strong) id item;
@end



@interface JSONFormatViewController : NSViewController<NSTextViewDelegate,NSOutlineViewDataSource>{
@private
    IBOutlet NSTextView *jsonStringTextView;
    IBOutlet NSOutlineView *jsonDataOutlineView;
    IBOutlet NSTextView *jsonFormatTextView;
    id jsonDate;
    NSMutableArray *items;
}

@end
