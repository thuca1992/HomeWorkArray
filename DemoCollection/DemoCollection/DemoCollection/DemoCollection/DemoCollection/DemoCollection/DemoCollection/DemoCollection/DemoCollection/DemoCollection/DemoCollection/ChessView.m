//
//  ChessView.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "ChessView.h"

@interface ChessView (){
    CGFloat margin;
    CGFloat h0;
    UIView *containerView;
}

@end

@implementation ChessView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
}

- (void)initData{
    margin = 10.0;
    h0 = 160.0;
    self.view.backgroundColor = [UIColor grayColor];
    
    containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin * 2.0, self.view.bounds.size.width - margin * 2.0)];
    containerView.backgroundColor = [UIColor blackColor];
     [self.view addSubview:containerView];
    containerView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    CGFloat cellWidth = (self.view.bounds.size.width - margin * 2.0) / 8.0;
    for (int rowIndex = 0; rowIndex < 8; rowIndex++) {
        for (int columnIndex= 0; columnIndex< 8 ; columnIndex++) {
            CGRect rect = CGRectMake(columnIndex * cellWidth, rowIndex * cellWidth, cellWidth, cellWidth);
            UIView *cell = [[UIView alloc]initWithFrame:rect];
            if (rowIndex % 2 == 0) {
                cell.backgroundColor = (columnIndex % 2 ==0 ) ? [UIColor blackColor] : [UIColor whiteColor];
            }
            else{
                cell.backgroundColor = (columnIndex % 2 ==0 ) ? [UIColor whiteColor] : [UIColor blackColor];
            }
            [containerView addSubview:cell];
        }
    }
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(20, self.view.bounds.size.height - 100, self.view.bounds.size.width - 40, 10)];
    slider.maximumValue = 1;
    slider.minimumValue = -1;
    slider.value = 0;
    [slider addTarget:self action:@selector(onRotate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

- (void)onRotate: (UISlider*)slider{
    containerView.transform = CGAffineTransformMakeRotation(slider.value * M_PI);
}

@end
