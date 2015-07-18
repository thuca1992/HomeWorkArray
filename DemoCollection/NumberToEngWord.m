//
//  NumberToEngWord.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "NumberToEngWord.h"

@implementation NumberToEngWord

- (void)viewDidLoad {
    
    
    NSNumber* numbers[5] = {@1005, @25, @300, @86080, @68004};
    for (int i =0 ; i < 5; i++) {
        [self changeNumberToWord:[numbers[i] intValue]];
    }
}

- (void)changeNumberToWord: (int)num{
    NSString *digit[21] = { @"", @"one", @"two", @"three", @"four", @"five", @"six", @"seven",
                            @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen",
                            @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen",
                            @"nineteen"};
    NSString *tens[10] = {@"", @"", @"twenty", @"thirty", @"forty", @"fifty", @"sixty",
        @"seventy", @"eighty", @"ninety"};
    int prev = 0;
    int div = 10000;
    NSMutableString *engWord = [NSMutableString new];
    int temp;
    while (div) {
        if ((num / div ) % 10 >0 || (div == 10 && (num % 10) > 0 )) {
            if (prev) {
                [engWord appendString:@"and "];
                 prev = 0;
            }
            
            switch (div) {
                case 10000:
                    temp = num / 1000;
                    if ( (temp % 100) >=10 && (temp % 100) <=19 ) {
                        [engWord appendString:digit[temp % 100]];
                    }
                    else{
                        [engWord appendString:tens[( temp / 10) % 10]];
                        [engWord appendString:@" "];
                        [engWord appendString:digit[(temp % 10) % 10]];
                    }
                   
                    [engWord appendString:@" thousand"];
                    prev = 1;
                    div /= 10;
                    break;
                case 1000:
                    [engWord appendString:digit[(num / div )%10]];
                    [engWord appendString:@" thousand"];
                    prev = 1;
                    break;
                case 100:
                    [engWord appendString:digit[(num / div )%10]];
                    [engWord appendString:@" hundred"];
                    prev = 1;
                    break;
                case 10:
                    if ( (num % 100) >=10 && (num % 100) <=19 ) {
                        [engWord appendString:digit[num % 100]];
                    }
                    else{
                        [engWord appendString:tens[(num % 100) / 10]];
                        [engWord appendString:digit[num % 10]];
                    }
                         break;
            }
            [engWord appendString:@" "];
        }
        div /= 10;
    }
    NSLog(@"%@", engWord);
}
@end
