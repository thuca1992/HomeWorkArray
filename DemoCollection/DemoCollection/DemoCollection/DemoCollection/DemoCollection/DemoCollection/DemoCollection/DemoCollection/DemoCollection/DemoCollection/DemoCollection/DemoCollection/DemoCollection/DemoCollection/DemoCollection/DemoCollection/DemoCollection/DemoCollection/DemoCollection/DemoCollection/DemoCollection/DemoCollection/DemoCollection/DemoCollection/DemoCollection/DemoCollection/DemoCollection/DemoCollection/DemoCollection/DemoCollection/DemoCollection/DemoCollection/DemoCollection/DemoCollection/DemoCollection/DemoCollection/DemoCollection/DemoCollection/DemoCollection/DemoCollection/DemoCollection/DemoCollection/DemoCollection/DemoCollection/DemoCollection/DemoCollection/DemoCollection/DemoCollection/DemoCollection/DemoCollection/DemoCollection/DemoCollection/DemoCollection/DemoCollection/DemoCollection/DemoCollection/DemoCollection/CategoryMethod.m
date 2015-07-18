//
//  CategoryMethod.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "CategoryMethod.h"
#import "NSArray+UniqueElement.h"

@interface CategoryMethod ()

@end

@implementation CategoryMethod

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
}

- (void)initData{
    NSArray* arr2 = @[@"ABC", @3.14, [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://techmaster.vn/tech/img/logo.png"]]],@"ABC",@3.14,@"BCA"];
    NSLog(@"%s \r %@", "mang ban dau", arr2);
    
    NSArray *arrUniqueElement = [NSArray new];
    arrUniqueElement = [arr2 elementFilter];
    
     NSLog(@"%s \r %@", "mang sau khi loc phan tu", arrUniqueElement);
    
}

@end
