//
//  StarsField.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/7/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "StarsField.h"

@interface StarsField ()

@end

@implementation StarsField {
    UIImageView* brownStar;
    UIImageView* greenStar;
    UIImageView* redStar;
    UIImageView* violetStar;
    CGPoint center;
    CGSize mainSize;
    CGFloat statusNavigationBarHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    mainSize = self.view.bounds.size;
    [self addStars];
    [self starAnimating];
}

-(void) addStars {
    brownStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown"]];
    greenStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    redStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red"]];
    violetStar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet"]];
    
    statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height;
    center = CGPointMake(mainSize.width / 2, (mainSize.height + statusNavigationBarHeight) /2);
    brownStar.center = center;
    greenStar.center = center;
    redStar.center = center;
    violetStar.center = center;
    
    [self.view addSubview:brownStar];
    [self.view addSubview:greenStar];
    [self.view addSubview:redStar];
    [self.view addSubview:violetStar];
    
}

-(void) starAnimating {
    [UIView animateWithDuration:1.0
                     animations:^{
                         brownStar.center = CGPointMake(1.707 * mainSize.width * 1/2, mainSize.height * 1/2 - 0.707 * 1/2 * mainSize.width);
                         greenStar.center = CGPointMake((1 - 0.707) * mainSize.width * 1/2, mainSize.height * 1/2 - 0.707 * 1/2 * mainSize.width);
                         redStar.center = CGPointMake((1 - 0.707) * mainSize.width * 1/2, mainSize.width * 1/2 + mainSize.height * 1/2);
                         violetStar.center = CGPointMake(1.707 * mainSize.width * 1/2, mainSize.width * 1/2 + mainSize.height * 1/2);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.0 
                                          animations:^{
                                              brownStar.center = CGPointMake(mainSize.width * 1/2, mainSize.height * 1/2 - 0.707 * 1/2 * mainSize.width);
                                              greenStar.center = CGPointMake((1 - 0.707) * mainSize.width * 1/2, (mainSize.height + statusNavigationBarHeight)* 1/2);
                                              redStar.center = CGPointMake(mainSize.width * 1/2, mainSize.width * 1/2 + mainSize.height * 1/2);
                                              violetStar.center = CGPointMake(1.707 * mainSize.width * 1/2, (mainSize.height + statusNavigationBarHeight)* 1/2);
                                          } completion:^(BOOL finished) {
                                              [UIView animateWithDuration:1.0
                                                               animations:^{
                                                                   brownStar.center = center;
                                                                   greenStar.center = center;
                                                                   redStar.center = center;
                                                                   violetStar.center = center;
                                                               } completion:^(BOOL finished) {
                                                                   [self starAnimating];
                                                               }];
                                          }];
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
