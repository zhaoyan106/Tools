//
//  PushViewController.m
//  Tools
//
//  Created by Dawn on 14-6-6.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import "PushViewController.h"

@implementation PushMessage


@end

@interface PushViewController ()

@end

@implementation PushViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.

    }
    return self;
}


- (void)loadView{
    [super loadView];
    [pushTypeComboBox selectItemAtIndex:0];
}

- (IBAction) pushBtnClick:(id)sender{
    PushMessage *message = [[PushMessage alloc] init];
    message.ip = ipTextField.stringValue;
    message.token = tokenTextField.stringValue;
    message.url = urlTextField.stringValue;
    message.content = contentTextField.stringValue;
    message.pushType = pushTypeComboBox.indexOfSelectedItem;
    
    [self pushMessage:message];
}

- (void) pushMessage:(PushMessage *)message{
    NSURL *url=[[NSURL alloc]initWithString:message.ip];
    NSMutableURLRequest *request= [[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [request setValue:@"gzip,deflate,sdch" forHTTPHeaderField:@"Accept-Encoding"];
    [request setValue:@"zh-CN,zh;q=0.8,en;q=0.6" forHTTPHeaderField:@"Accept-Language"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPMethod:@"POST"];
    NSString *postStr = [NSString stringWithFormat:@"pushid=%@&pushtype=%ld&url=%@&channel=wireless&token=87a39e5d7209464c91e6e704734c9fb6&content=%@&interfacetype=0&pushcount=&pushtime=&title=&picurl=&datatype=", message.token,(long)message.pushType,message.url,message.content];
    NSData *data = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    [request setValue:[NSString stringWithFormat:@"%ld",data.length] forHTTPHeaderField:@"Content-Length"];
    
    NSError *err=nil;
    NSData *responseData=[NSURLConnection sendSynchronousRequest:request
                                               returningResponse:nil
                                                           error:&err];
    if(data != nil){
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        //responseString =  [self URLDecodedString:responseString];
        NSRange range0 = [responseString rangeOfString:@"{"];
        NSRange range1 = [responseString rangeOfString:@"};"];
        NSRange range;
        range.location = range0.location;
        range.length = range1.location + range1.length - range0.location;
        NSString *msgInfo = [responseString substringWithRange:range];
        msgInfo = [msgInfo stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
        textView.string = [NSString stringWithFormat:@"%@%d:%@\n",textView.string,++count,msgInfo];
    }
}


- (NSString *)URLEncodedString:(NSString *)resource
{
    
	//!*'();:@&amp;=+$,/?%#[]
	CFStringRef cfResult = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
																   (CFStringRef)resource,
																   NULL,
																   CFSTR("&=@;!'*#%-,:/()<>[]{}?+ "),
																   kCFStringEncodingUTF8);
	
	NSString *result = [NSString stringWithString:(__bridge NSString *)cfResult];
	CFRelease(cfResult);
	
    return result;
}

- (NSString*)URLDecodedString:(NSString *)resource
{
    CFStringRef cfResult = (CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
															(CFStringRef)resource,
															CFSTR(""),
															kCFStringEncodingUTF8));
    
    NSString *result = [NSString stringWithString:(__bridge NSString *)cfResult];
    CFRelease(cfResult);
    
    return result;
}

@end
