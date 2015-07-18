//
//  QuickSort.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort{
    int twoDimensionArr[8][8];
}

- (void)viewDidLoad{
    
    [self createTwoDimentsionArray];
    
    [self printArr];
    
    [self reOderTwoDimensionArr];
    
    [self printArr];
    
}

- (void)reOderTwoDimensionArr{
    NSMutableArray* unsortedArr = [NSMutableArray new];
    for (int i=0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            [unsortedArr addObject:[NSNumber numberWithInt:twoDimensionArr[i][j]]];
        }
    }
    NSArray *sortedArray = [self quickSort:unsortedArr];
    
    int position = 0;
    for (int i=0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            twoDimensionArr[i][j] = [sortedArray[position] intValue];
            position++;
        }
    }
}

-(NSArray*)quickSort:(NSMutableArray*)unsortedArray
{
    NSInteger numberOfElements = [unsortedArray count];
    if(numberOfElements <= 1){
        return unsortedArray;
    }
    
    NSNumber* pivotValue = [unsortedArray objectAtIndex: numberOfElements/2];
    
    NSMutableArray* lessArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    NSMutableArray* moreArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    NSMutableArray* equalArray = [[NSMutableArray alloc] initWithCapacity:numberOfElements];
    [unsortedArray removeObjectAtIndex:numberOfElements/2];
    
    for (NSNumber* value in unsortedArray) {
        if([value floatValue] < [pivotValue floatValue]){
            [lessArray addObject:value];
        } else if([value floatValue] > [pivotValue floatValue]){
            [moreArray addObject:value];
        }else if([value floatValue] == [pivotValue floatValue]){
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

- (void)createTwoDimentsionArray{
    
    for (int i=0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            twoDimensionArr[i][j] = arc4random_uniform(100);
        }
    }
    
}

- (void)printArr{
    printf("\n\n\n");
    for (int i=0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            printf("%i ",twoDimensionArr[i][j]);
        }
        printf("\n");
    }
}
@end
