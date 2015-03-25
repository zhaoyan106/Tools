//
//  UnicodeViewController.m
//  Tools
//
//  Created by Dawn on 14-4-16.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import "UnicodeViewController.h"

@interface UnicodeViewController ()

@end

@implementation UnicodeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (NSString *) unicodeDecodedString:(NSString *)str{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *decodevalue = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
    return decodevalue;
}

- (NSString *) unicodeEncodedString:(NSString *)str{
    NSData *dataenc = [str dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *encodevalue = [[NSString alloc]initWithData:dataenc encoding:NSUTF8StringEncoding];
    return encodevalue;
}

#pragma mark -
#pragma mark Actions
- (IBAction)urlDecodingBtnClick:(id)sender{
    [unicodeToTextView setString:[self unicodeDecodedString:unicodeFromTextView.string]];
}

- (IBAction)urlEncodingBtnClick:(id)sender{
    [unicodeFromTextView setString:[self unicodeEncodedString:unicodeToTextView.string]];
}
@end
