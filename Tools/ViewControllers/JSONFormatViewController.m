//
//  JSONFormatViewController.m
//  Tools
//
//  Created by Dawn on 14-3-25.
//  Copyright (c) 2014年 Dawn. All rights reserved.
//

#import "JSONFormatViewController.h"

@implementation JSONItem

@end




@interface JSONFormatViewController ()

@end

@implementation JSONFormatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void) loadView{
    [super loadView];
    jsonStringTextView.delegate = self;
    jsonDataOutlineView.dataSource = self;
    NSTableColumn *nodeColum = [[jsonDataOutlineView tableColumns] objectAtIndex:0];
    nodeColum.identifier = @"node";
    
    NSTableColumn *descriptionColum = [[jsonDataOutlineView tableColumns] objectAtIndex:1];
    descriptionColum.identifier = @"description";
    
    items = [[NSMutableArray alloc] initWithCapacity:0];
}

#pragma mark -
#pragma mark NSTextFieldDelegate
- (BOOL) textView:(NSTextView *)textView shouldChangeTextInRange:(NSRange)affectedCharRange replacementString:(NSString *)replacementString{
    NSString *jsonString = [jsonStringTextView.string stringByReplacingCharactersInRange:affectedCharRange withString:replacementString];
    jsonDate = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:NULL];
    
    [items removeAllObjects];
    
    [jsonDataOutlineView reloadData];
    
    if ([NSJSONSerialization isValidJSONObject:jsonDate]) {
        NSError *error;
        NSData *registerData = [NSJSONSerialization dataWithJSONObject:jsonDate options:NSJSONWritingPrettyPrinted error:&error];
        jsonFormatTextView.string = [[NSString alloc] initWithData:registerData encoding:NSUTF8StringEncoding];
    }else{
        jsonFormatTextView.string = @"";
    }
    return YES;
}

#pragma mark -
#pragma mark NSOutlineViewDataSource
-(NSInteger) outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item{
    if (item == nil) {
        // 第一项
        if (jsonDate) {
            return 1;
        }else{
            return 0;
        }
    }else{
        JSONItem *jsonItem = (JSONItem *)item;
        if ([jsonItem.item isKindOfClass:[NSArray class]]) {
            return ((NSArray *)(jsonItem.item)).count;
        }else if([jsonItem.item isKindOfClass:[NSDictionary class]]){
            return [jsonItem.item allKeys].count;
        }else{
            return 0;
        }
    }
}

-(BOOL) outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item{
    JSONItem *jsonItem = (JSONItem *)item;
    if ([jsonItem.item isKindOfClass:[NSArray class]]) {
        return ((NSArray *)(jsonItem.item)).count > 0;
    }else if([jsonItem.item isKindOfClass:[NSDictionary class]]){
        return [jsonItem.item allKeys].count > 0;
    }else{
        return NO;
    }
}

-(id) outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item{
    if (item == nil) {
        JSONItem *jsonItem = [[JSONItem alloc] init];
        jsonItem.key = @"";
        jsonItem.item = jsonDate;
        [items addObject:jsonItem];
        return jsonItem;
    }else{
        JSONItem *jsonItem = (JSONItem *)item;
        if ([jsonItem.item isKindOfClass:[NSArray class]]) {
            JSONItem *childJSONItem = [[JSONItem alloc] init];
            childJSONItem.key = [NSString stringWithFormat:@"%ld",index];
            childJSONItem.item = [jsonItem.item objectAtIndex:index];
            [items addObject:childJSONItem];
            return childJSONItem;
        }else if([jsonItem.item isKindOfClass:[NSDictionary class]]){
            NSArray *keys = [[jsonItem.item allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                return [obj1 localizedCaseInsensitiveCompare:obj2];
            }];
            
            JSONItem *childJSONItem = [[JSONItem alloc] init];
            childJSONItem.key = [NSString stringWithFormat:@"%@",[keys objectAtIndex:index]];
            childJSONItem.item = [jsonItem.item objectForKey:childJSONItem.key];
            [items addObject:childJSONItem];
            return childJSONItem;
        }else{
            return nil;
        }
    }
}

-(id) outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item{
    JSONItem *jsonItem = (JSONItem *)item;
    if ([tableColumn.identifier isEqualToString:@"node"]) {
        return jsonItem.key;
    }else{
        if([jsonItem.item isKindOfClass:[NSDictionary class]]){
            return [NSString stringWithFormat:@"Dict(%ld)",[jsonItem.item allKeys].count];
        }else if([jsonItem.item isKindOfClass:[NSArray class]]){
            return [NSString stringWithFormat:@"Array(%ld)",((NSArray *)(jsonItem.item)).count];
        }else{
            return jsonItem.item;
        }
    }
}


- (BOOL)outlineView:(NSOutlineView *)outlineView shouldEditTableColumn:(NSTableColumn *)tableColumn item:(id)item{
    return NO;
}

@end
