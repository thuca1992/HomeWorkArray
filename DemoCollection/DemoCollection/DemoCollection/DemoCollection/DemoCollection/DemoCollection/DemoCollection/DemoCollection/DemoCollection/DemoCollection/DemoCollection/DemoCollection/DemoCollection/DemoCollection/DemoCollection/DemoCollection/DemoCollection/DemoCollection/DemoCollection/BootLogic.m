//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"NSArray", MENU: @[
                                    @{TITLE: @"Create", CLASS: @"CreateArray"},
                                
                          ]};
//    NSDictionary* intermediate = @{SECTION: @"NSDictionary", MENU: @[
//                                    @{TITLE: @"Create", CLASS: @"CreateDictionary"}
//                                  ]};
//    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
//                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
//                             ]};
    
    NSDictionary* homework = @{SECTION:@"HomeWork", MENU:@[
                                    @{TITLE: @"HW1",CLASS:@"FootballClub"},
                                    @{TITLE: @"HW2",CLASS:@"CategoryMethod"},
                                    @{TITLE: @"Number To English Word", CLASS:@"NumberToEngWord"},
                                    @{TITLE: @"Quick sort 2 dimension array", CLASS:@"QuickSort"},
                                    @{TITLE: @"Quick sort string array", CLASS:@"QuickSortString"},
                                    @{TITLE: @"Dictionary", CLASS:@"DictionaryExample"},
                                    @{TITLE: @"WordCounting", CLASS:@"WordCoutingExample"},
                                    @{TITLE: @"Swift To Objective C ChessView", CLASS:@"ChessView"},
                                    @{TITLE: @"Swift To Objective C BasicView", CLASS:@"BasicView"},
                                    @{TITLE: @"UIIMageView Animation", CLASS:@"AnimationImages"}
                            ]};
    
    mainScreen.menu = @[homework];
    mainScreen.title = @"Collection Programming";
    mainScreen.about = @"This is Collection Programming in Objecitve_C";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
