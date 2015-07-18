//
//  DictionaryExample.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "DictionaryExample.h"

@interface DictionaryExample (){
    NSDictionary *dic;
    NSArray *arr;
}
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DictionaryExample
- (void)viewDidLoad{
    [super viewDidLoad];
    [self initData];
}

- (void)initData{
    dic = [NSDictionary dictionaryWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"DictionaryExample" ofType:@"plist"]];
    NSLog(@"%@", dic);
    [self.textfield addTarget:self
                  action:@selector(onTextChange)
        forControlEvents:UIControlEventEditingChanged];
}

- (void)onTextChange{
    NSInteger textFieldLength = self.textfield.text.length;
    if(textFieldLength == 0){
        self.label.text = @"";
        return;
    }
    NSString *firstCharacter = [self.textfield.text substringToIndex:1];
    if ([dic objectForKey:firstCharacter]) {
        arr = dic[firstCharacter];
        NSMutableString *wordSatisfyCondition = [NSMutableString new];
        for (int i = 0; i< arr.count; i++) {
            NSString *word = arr[i];
            if (word.length >= textFieldLength) {
                if ([self checkContains:word andInput:self.textfield.text]) {
                    [wordSatisfyCondition appendString:word];
                    [wordSatisfyCondition appendString:@"\n"];
                }
            }
        }
        self.label.text = wordSatisfyCondition;
    }
    else{
        self.label.text = @"";
    }
    
}


- (BOOL)checkContains: (NSString*)dictionary andInput: (NSString*)input{
    if ([dictionary rangeOfString:input].location == 0) {
        return true;
    }else{
        return false;
    }
}

@end
