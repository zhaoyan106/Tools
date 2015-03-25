//
//  DateViewController.m
//  Tools
//
//  Created by Dawn on 14-3-24.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()

@end

@implementation DateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (NSDate *)parseJsonDate:(NSString *)jsondate{
	
	NSRange range1 = [jsondate rangeOfString:@"Date("];
	NSRange range2 = [jsondate rangeOfString:@")"];
	long start = range1.location + range1.length;
	long end = range2.location;
	
	NSCharacterSet* timezoneDelimiter = [NSCharacterSet characterSetWithCharactersInString:@"+-"];
	NSRange rangeOfTimezoneSymbol = [jsondate rangeOfCharacterFromSet:timezoneDelimiter];
	NSTimeInterval interval;
	if (rangeOfTimezoneSymbol.length!=0) {
		long firstend = rangeOfTimezoneSymbol.location;
		
		NSRange secondrange=NSMakeRange(start, firstend-start);
		NSString* timeIntervalString = [jsondate substringWithRange:secondrange];
		
		unsigned long long s = [timeIntervalString longLongValue];
		interval = s/1000;
	}
	else {
		NSRange timerange=NSMakeRange(start, end-start);
		NSString* timestring =[jsondate substringWithRange:timerange];
		unsigned long long t = [timestring longLongValue];
		interval = t/1000;
	}
    
	return [NSDate dateWithTimeIntervalSince1970:interval];
}


- (NSString *)makeJsonDateWithNSTimeInterval:(NSTimeInterval)seconds{
	
	NSTimeZone *stz=[NSTimeZone systemTimeZone];
	NSDateFormatter* f = [[NSDateFormatter alloc] init];
	[f setTimeZone:stz];
	[f setDateFormat:@"Z"];
	NSString *jsondate=[NSString stringWithFormat:@"Date(%.f%@)",seconds*1000,[f stringFromDate:[NSDate date]]];
    
	return jsondate;
}


- (NSString *)makeJsonDateWithUTCDate:(NSDate *)utcDate{
	NSTimeInterval seconds = [utcDate timeIntervalSince1970];
	
	return [self makeJsonDateWithNSTimeInterval:seconds];
}


- (NSString *)makeJsonDateWithDisplayNSStringFormatter:(NSString *)string formatter:(NSString *)formatter {
	
	NSTimeZone *dtz = [NSTimeZone systemTimeZone];
	NSDateFormatter *f = [[NSDateFormatter alloc] init];
	[f setTimeZone:dtz];
	[f setDateFormat:formatter];
	NSDate *d = [f dateFromString:string];
    
	return [self makeJsonDateWithUTCDate:d];
}


- (NSString *)displayNoTimeZoneJsonDate:(NSString *)jsonDate formatter:(NSString *)formatter {
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	NSTimeZone *tz=[NSTimeZone systemTimeZone];
	[format setTimeZone:tz];
	[format setDateFormat:formatter];
	return [format stringFromDate:[self parseJsonDate:jsonDate]];
}

#pragma mark -
#pragma mark Actions
- (IBAction)json2NormalBtnClick:(id)sender{
    if (dateFromTextField.stringValue.length) {
        @try {
            dateToTextField.stringValue = [self displayNoTimeZoneJsonDate:dateFromTextField.stringValue formatter:@"yyyy-MM-dd"];
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
    }
}

- (IBAction)normal2JSONBtnClick:(id)sender{
    if (dateToTextField.stringValue.length) {
        @try {
            dateFromTextField.stringValue = [self makeJsonDateWithDisplayNSStringFormatter:dateToTextField.stringValue formatter:@"yyyy-MM-dd"];
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
    }
}
@end
