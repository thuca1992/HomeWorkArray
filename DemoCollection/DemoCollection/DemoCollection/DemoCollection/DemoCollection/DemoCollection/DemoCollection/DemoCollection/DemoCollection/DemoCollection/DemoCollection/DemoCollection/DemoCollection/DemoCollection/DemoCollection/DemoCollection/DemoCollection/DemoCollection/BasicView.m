//
//  BasicView.m
//  DemoCollection
//
//  Created by Nguyen Thanh Tung on 7/18/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "BasicView.h"

@interface BasicView (){
    BOOL isHidden;
}

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UISlider *rotate;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;
@property (weak, nonatomic) IBOutlet UISlider *alpha;
@property (weak, nonatomic) IBOutlet UISegmentedControl *color;

@end

@implementation BasicView

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


- (IBAction)onShow:(id)sender {
    if (isHidden) {
        isHidden = false;
    }
    else{
        isHidden = true;
    }
    self.myView.hidden = isHidden;
}
- (IBAction)onAlphaChange:(id)sender {
    self.myView.alpha = self.alpha.value;
}

- (void)rotateAndScale{
    CGAffineTransform rotateTransform =  CGAffineTransformMakeRotation(self.rotate.value * M_PI);
    CGAffineTransform scalaTransform = CGAffineTransformMakeScale(self.scaleSlider.value, self.scaleSlider.value);
    self.myView.transform = CGAffineTransformConcat(rotateTransform, scalaTransform);
}

- (IBAction)onRotate:(id)sender {
    [self rotateAndScale];
}

- (IBAction)onScaleChange:(id)sender {
    [self rotateAndScale];
}


- (IBAction)onColorChange:(id)sender {
    switch (self.color.selectedSegmentIndex) {
        case 0:
            self.myView.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            self.myView.backgroundColor = [UIColor redColor];
            break;
        case 2:
            self.myView.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            self.myView.backgroundColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}

@end
