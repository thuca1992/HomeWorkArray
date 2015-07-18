//
//  FootballClub.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/14/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "FootballClub.h"
#import "Player.h"

@interface FootballClub ()
@end

@implementation FootballClub{
    NSMutableArray* arrAllPlayer;
    NSMutableArray* arrTeamPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self createRandomTeam];
}

- (void)initData{
    arrAllPlayer = [NSMutableArray new];
    arrTeamPlayer = [NSMutableArray new];
     NSArray* arrFile = [NSArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];
    
    for (NSDictionary* item in arrFile) {
        Player* player = [[Player alloc] init:item[@"id"]andName:item[@"name"] andPosition:item[@"position"]];
        [arrAllPlayer addObject:player];
    }
}

- (void)createRandomTeam{
    int maxPlayer = 0;
    Player *player;
    NSInteger randomNumber;
    while(maxPlayer<11){
        
        randomNumber = [self randomNumberBetween:1 maxNumber:arrAllPlayer.count];
        player = arrAllPlayer[randomNumber];
        bool isExist = [self isExist:player.id];
        if ( !isExist ){
            [arrTeamPlayer addObject:player];
            NSLog(@"%@  - %@   - %@",player.id,player.name,player.position);
            maxPlayer++;
        }
    }
    

}

- (NSInteger)randomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max
{
    return min + arc4random() % (max - min);
}

- (BOOL)isExist: (NSInteger)id{
    for (int i = 0; i < arrTeamPlayer.count; i++) {
        Player* player = arrTeamPlayer[i];
        if( player.id == id){
            NSLog(@"%s - %ld - %ld","already exist",id,[player.id integerValue]);
            return true;
        }
    }
    return false;
}

@end
