//
//  UIViewBasic.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/7/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "UIViewBasic.h"

@interface UIViewBasic ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UISwitch *switch_;
@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;

@end

@implementation UIViewBasic

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSwitch:(UISwitch *)sender {
    self.image.hidden = !sender.on;
}

- (IBAction)onAlphaChange:(UISlider *)sender {
    self.image.alpha = sender.value;
}

-(void) rotateAndScale {
    self.image.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(self.rotateSlider.value * M_PI), CGAffineTransformMakeScale(self.scaleSlider.value, self.scaleSlider.value));
}

- (IBAction)onRotate:(UISlider *)sender {
    [self rotateAndScale];
}
- (IBAction)onScale:(UISlider *)sender {
    [self rotateAndScale];
}
- (IBAction)onSegmentChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.image.backgroundColor = [UIColor blueColor];
            break;
        case 1:
            self.image.backgroundColor = [UIColor redColor];
            break;
        case 2:
            self.image.backgroundColor = [UIColor blackColor];
            break;
        case 3:
            self.image.backgroundColor = [UIColor greenColor];
            break;
            
        default:
            break;
    } 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
