//
//  CrashFormatViewController.m
//  Tools
//
//  Created by Dawn on 14-4-16.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import "CrashFormatViewController.h"

@interface CrashFormatViewController ()

@end

@implementation CrashFormatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        clickNum = 0;
    }
    return self;
}

- (NSString *) crashFormat:(NSString *)log{
    log = [log stringByReplacingOccurrencesOfString:@"number" withString:@"\nnumber"];
    log = [log stringByReplacingOccurrencesOfString:@"{" withString:@"\n{"];
    log = [log stringByReplacingOccurrencesOfString:@"\", \"" withString:@"\",\n \""];
    log = [log stringByReplacingOccurrencesOfString:@"= ( \"" withString:@"= ( \n \""];
    log = [log stringByReplacingOccurrencesOfString:@"; \"" withString:@";\n \""];
    if (clickNum == 1) {
       log = [log stringByReplacingOccurrencesOfString:@"\"; " withString:@"\"; \n"];
    }
    //
    log = [log stringByReplacingOccurrencesOfString:@"\" );" withString:@"\" );\n\n"];
    log = [self unicodeDecodedString:log];
    
    clickNum =!clickNum;
    return log;
}


- (NSString *) unicodeDecodedString:(NSString *)str{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *decodevalue = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
    return decodevalue;
}

#pragma mark -
#pragma mark Actions
- (IBAction)crashFormatBtnClick:(id)sender{
    
    [crashToTextView setString:[self crashFormat:crashFromTextView.string]];
    
    NSString *expression = [NSString stringWithFormat:@"%@%@%@",@"",@"(\\[.*?\\])",@""];
    
    NSString *string = [crashToTextView.textStorage string];
    
    
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern: expression options:NSRegularExpressionCaseInsensitive error:NULL];
    [regex enumerateMatchesInString:string options:0 range:NSMakeRange(0, [string length]) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        [crashToTextView.textStorage beginEditing];
        NSRange newrange = [result range];
        [crashToTextView.textStorage addAttribute:NSForegroundColorAttributeName
                                            value:[NSColor colorWithSRGBRed:53.0/255.0 green:155.0/255.0 blue:233.0/255.0 alpha:1.0]
                                            range:newrange];
        [crashToTextView.textStorage addAttribute:NSFontAttributeName value:[NSFont boldSystemFontOfSize:14.0f] range:newrange];
        
        [crashToTextView.textStorage endEditing];
    }];
    
    expression = [NSString stringWithFormat:@"TraceLog2Target = (.*?);"];
    regex = [NSRegularExpression regularExpressionWithPattern: expression options:NSRegularExpressionCaseInsensitive error:NULL];
    [regex enumerateMatchesInString:string options:0 range:NSMakeRange(0, [string length]) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        [crashToTextView.textStorage beginEditing];
        NSRange newrange = [result range];
        NSRange newrange2;
        newrange2.location = newrange.location + @"TraceLog2Target = ".length;
        newrange2.length = newrange.length - @"TraceLog2Target = ".length;
        [crashToTextView.textStorage addAttribute:NSForegroundColorAttributeName value:[NSColor colorWithSRGBRed:6.0/255.0 green:179.0/255.0 blue:10.0/255.0 alpha:1.0] range:newrange2];
        
        [crashToTextView.textStorage addAttribute:NSFontAttributeName value:[NSFont boldSystemFontOfSize:14.0f] range:newrange2];
        
        [crashToTextView.textStorage endEditing];
    }];
    
    expression = [NSString stringWithFormat:@"TraceLog3Action = (.*?);"];
    regex = [NSRegularExpression regularExpressionWithPattern: expression options:NSRegularExpressionCaseInsensitive error:NULL];
    [regex enumerateMatchesInString:string options:0 range:NSMakeRange(0, [string length]) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        [crashToTextView.textStorage beginEditing];
        NSRange newrange = [result range];
        NSRange newrange2;
        newrange2.location = newrange.location + @"TraceLog3Action = ".length;
        newrange2.length = newrange.length - @"TraceLog3Action = ".length;
        [crashToTextView.textStorage addAttribute:NSForegroundColorAttributeName value:[NSColor colorWithSRGBRed:6.0/255.0 green:179.0/255.0 blue:10.0/255.0 alpha:1.0] range:newrange2];
        
        [crashToTextView.textStorage addAttribute:NSFontAttributeName value:[NSFont boldSystemFontOfSize:14.0f] range:newrange2];
        
        [crashToTextView.textStorage endEditing];
    }];
    
//    
//    
//    [crashToTextView.textStorage beginEditing];
//    [crashToTextView.textStorage removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, [string length])];
//    [crashToTextView.textStorage removeAttribute:NSLinkAttributeName range:NSMakeRange(0, [string length])];
//    
//    for (NSTextCheckingResult *match in matches) {
//        NSRange matchRange = [match range];
//        if ([match resultType] == NSTextCheckingTypeRegularExpression) {
//            
//            //[crashToTextView.textStorage addAttributes:@{NSLinkAttributeName:url.absoluteString} range:matchRange];
//        }
//    }
//    [crashToTextView.textStorage endEditing];
}

@end
