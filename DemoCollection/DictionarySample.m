//
//  DictionarySample.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "DictionarySample.h"

@interface DictionarySample (){
    NSDictionary *dic;
}

@end

@implementation DictionarySample

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
}

- (void)initData{
    dic = [NSDictionary dictionaryWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"DictionaryExample" ofType:@"plist"]];
    NSLog(@"%@", dic);
}

@end
