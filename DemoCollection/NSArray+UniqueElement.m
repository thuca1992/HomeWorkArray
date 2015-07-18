//
//  NSArray+UniqueElement.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "NSArray+UniqueElement.h"

@implementation NSArray (UniqueElement)

-(NSArray *) elementFilter{
    NSMutableArray *arrUniqueElement = [NSMutableArray new];
    NSObject *object;
    for(int i =0 ;i < self.count ;i++){
        object = [self objectAtIndex:i];
        if (![self isExist:object andArray:arrUniqueElement]) {
             [arrUniqueElement addObject:object];
        }

    }
    
    return arrUniqueElement;
}

- (BOOL)isExist: (NSObject*)object andArray: (NSMutableArray*)arrUniqueElement{
    for (int i = 0; i < arrUniqueElement.count; i++) {
        if( [arrUniqueElement[i] isEqual:object]){
            return true;
        }
    }
    return false;
}

@end
