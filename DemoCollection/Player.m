//
//  Player.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/14/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype) init: (NSString*) id andName: (NSString*) name andPosition: (NSString*) position{
    if(self == [super init]){
        self.id = id;
        self.name = name;
        self.position = position;
    }
    return self;
}



@end
