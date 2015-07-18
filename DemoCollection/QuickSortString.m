//
//  QuickSortString.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "QuickSortString.h"

@implementation QuickSortString

- (void)viewDidLoad{
    NSMutableArray *test = [[NSMutableArray alloc] initWithObjects:@"aec",@"adc", @"abc",@"tag",@"www" ,nil];
    
    
    NSArray *hehe = [self quickSort:test];
    NSLog(@"%@",hehe);
    
    
}


-(NSArray*)quickSort:(NSMutableArray*)unsortedArray
{
    NSInteger numberOfElements = [unsortedArray count];
    if(numberOfElements <= 1){
        return unsortedArray;
    }

    NSString* pivotValue = [unsortedArray objectAtIndex: numberOfElements/2];
    
    NSMutableArray* lessArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    NSMutableArray* moreArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    NSMutableArray* equalArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    [unsortedArray removeObjectAtIndex:numberOfElements/2];

    for (NSNumber* value in unsortedArray) {
        NSComparisonResult result = [value compare:pivotValue];
        
        if(result == NSOrderedAscending){
            [lessArray addObject:value];
        } else if(result == NSOrderedDescending){
            [moreArray addObject:value];
        }else if(result == NSOrderedSame){
            [equalArray addObject:value];
        }
    }
    
    NSMutableArray* sortedArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    [sortedArray addObjectsFromArray:[self quickSort:lessArray]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:equalArray];
    [sortedArray addObjectsFromArray:[self quickSort:moreArray]];
    
    return [sortedArray copy];
}
@end
