//
//  ViewController.m
//  ShipAnimatingOnSea
//
//  Created by Hoàng Thái on 3/5/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "ShipAndSea.h"

@interface ShipAndSea ()

@end

@implementation ShipAndSea {
    UIImageView *ship;
    UIImageView *sea1;
    UIImageView *sea2;
    CGSize mainSize;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    mainSize = self.view.bounds.size;
    [self addSea];
    [self addShip];
    [self shipAnimating];
    [self seaAnimating];
}

- (void) addSea {
    sea1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mainSize.width, mainSize.height)];
    sea1.image = [UIImage imageNamed:@"sea1.jpg"];
    sea2 = [[UIImageView alloc] initWithFrame:CGRectMake(mainSize.width, 0, mainSize.width, mainSize.height)];
    sea2.image = [UIImage imageNamed:@"sea2.jpg"];
    [self.view addSubview:sea1];
    [self.view addSubview:sea2];
}

- (void) addShip {
    ship = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ship.ico"]];
    ship.frame = CGRectMake(0, 0, 128, 128);
    ship.center = CGPointMake(mainSize.width / 2, mainSize.height * 3/4);
    [self.view addSubview:ship];
}

- (void) shipAnimating {
    [UIView animateWithDuration:1.0
                     animations:^{
                         ship.transform = CGAffineTransformMakeRotation(M_PI / 6);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.0
                                          animations:^{
                                              ship.transform = CGAffineTransformMakeRotation(M_PI/ -6);
                                          } completion:^(BOOL finished) {
                                              [self shipAnimating];
                                          }];
                     }];
}

- (void) seaAnimating {
    [UIView animateWithDuration:2.0
                     animations:^{
                         sea1.frame = CGRectMake(-mainSize.width, 0, mainSize.width, mainSize.height);
                         sea2.frame = self.view.bounds;
                     } completion:^(BOOL finished) {
                         sea1.frame = CGRectMake(mainSize.width, 0, mainSize.width, mainSize.height);
                         [UIView animateWithDuration:2
                                          animations:^{
                                              sea2.frame = CGRectMake(-mainSize.width, 0, mainSize.width, mainSize.height);
                                              sea1.frame = self.view.bounds;
                                          } completion:^(BOOL finished) {
                                              sea2.frame = CGRectMake(mainSize.width, 0, mainSize.width, mainSize.height);
                                              [self seaAnimating];
                                          }];
                     }];
}

@end
