//
//  UrlCodingViewController.m
//  Tools
//
//  Created by Dawn on 14-3-25.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import "UrlCodingViewController.h"

@interface UrlCodingViewController ()

@end

@implementation UrlCodingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (NSString *)URLEncodedString:(NSString *)string{
    
	//!*'();:@&amp;=+$,/?%#[]
	CFStringRef cfResult = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
																   (CFStringRef)string,
																   NULL,
																   CFSTR("&=@;!'*#%-,:/()<>[]{}?+ "),
																   kCFStringEncodingUTF8);
	
	NSString *result = [NSString stringWithString:(__bridge NSString *)cfResult];
	CFRelease(cfResult);
	
    return result;
}

- (NSString*)URLDecodedString:(NSString *)string{
    NSString *result = (NSString *)
	CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
															(CFStringRef)string,
															CFSTR(""),
															kCFStringEncodingUTF8));
    return result;
}

#pragma mark -
#pragma mark Actions
- (IBAction)urlDecodingBtnClick:(id)sender{
    [urlToTextView setString:[self URLDecodedString:urlFromTextView.string]];
}

- (IBAction)urlEncodingBtnClick:(id)sender{
    [urlFromTextView setString:[self URLEncodedString:urlToTextView.string]];
}
@end
