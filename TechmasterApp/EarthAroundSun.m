//
//  EarthAroundSun.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/7/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "EarthAroundSun.h"

@interface EarthAroundSun ()

@end

@implementation EarthAroundSun {
    UIImageView *earth, *sun;
    CGFloat earthRadius, sunRadius, angle;
    CGFloat distanceSunToEarth;
    NSTimer *timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    earthRadius = 32.0;
    distanceSunToEarth = self.view.bounds.size.width / 2 - earthRadius;
    angle = 0.0;
    [self addSunAndEarth];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
}

- (void) addSunAndEarth {
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.ico"]];
    earth.frame = CGRectMake(0, 0, 64, 64);
    earth.center = CGPointMake(earthRadius, self.view.bounds.size.height / 2);
    [self.view addSubview:earth];
    
    sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun.ico"]];
    sun.frame = CGRectMake(0, 0, 64, 64);
    sun.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    [self.view addSubview:sun];
    
}

- (void) spinEarth {
    angle += 0.01;
    earth.center = CGPointMake(sun.center.x + distanceSunToEarth * cos(angle),
                               sun.center.y + distanceSunToEarth * sin(angle));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
