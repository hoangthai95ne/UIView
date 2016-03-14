//
//  DropBall.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/7/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()

@end

@implementation DropBall {
    UIImageView *ball;
    CGFloat ballRadius;
    CGFloat velocity, acceleration, distance;
    NSTimer *timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    ballRadius = 32.0;
    acceleration = 0.0;
    distance = 0.0;
    velocity = 0.12;
    [self addBall];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil 
                                            repeats:true];
}

- (void) addBall {
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    ball.frame = CGRectMake(0, 0, 64, 64);
    ball.center = CGPointMake(self.view.bounds.size.width / 2, ballRadius);
    [self.view addSubview:ball];
}

- (void) dropBall {
    acceleration += velocity;
    distance += acceleration;
    ball.center = CGPointMake(self.view.bounds.size.width / 2, ballRadius + distance);
    if (ball.center.y >= self.view.bounds.size.height - ballRadius) {
        acceleration *= -0.9;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
}


@end
