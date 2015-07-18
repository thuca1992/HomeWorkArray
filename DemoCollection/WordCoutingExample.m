//
//  WordCoutingExample.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "WordCoutingExample.h"

@interface WordCoutingExample (){
    NSMutableDictionary *dic;
    NSString *content;
    NSArray *ignoreList;
    int currentCursor;
}

@end

@implementation WordCoutingExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    currentCursor = 0;
    
    [self initData];
    
    
    NSLog(@"%@",content);
    
    [self textCounting];
    NSLog(@"%@",dic);
}

- (void)initData{
    dic = [NSMutableDictionary new];
    
    content = @"I am happy to join with you today i nation in what will go downn in as the greastest demonstration for freedom in the history nation our nation";
    
    ignoreList = @[@"i",@"am",@"the",@"is",@"to",@"an",@"were",@"was"];
}

- (void) textCounting{
    NSArray *arrWord = [content componentsSeparatedByString:@" "];
    
    for (int i = 0 ; i < arrWord.count; i++) {
        NSString* word = arrWord[i];
        word = [word lowercaseString];
        if ([self isInIgnoreList:word]) {
            continue;
        }
        if ([self containsKey:word]) {
            NSString *count = (NSString*)[dic objectForKey:word];
            NSInteger value = [count integerValue];
            value++;
            [dic setObject:[@(value) stringValue] forKey:word];
        }else{
            [dic setObject:@1 forKey:word];
        }
        
    }

}

- (BOOL)containsKey: (NSString *)key {
    BOOL retVal = 0;
    NSArray *allKeys = [dic allKeys];
    retVal = [allKeys containsObject:key];
    return retVal;
}

- (BOOL)isInIgnoreList: (NSString *)key {
    BOOL retVal = 0;
    
    retVal = [ignoreList containsObject:key];
    return retVal;
}

@end
