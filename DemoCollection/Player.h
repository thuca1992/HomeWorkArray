//
//  Player.h
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/14/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *position;

- (instancetype) init: (NSString*) id andName: (NSString*) name andPosition: (NSString*) position;


@end
