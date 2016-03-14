//
//  RollingBall.m
//  TechmasterApp
//
//  Created by Hoàng Thái on 3/7/16.
//  Copyright © 2016 Techmaster. All rights reserved.
//

#import "RollingBall.h"

@interface RollingBall ()

@end

@implementation RollingBall {
    UIImageView* ball;
    CGFloat statusNavigationBarHeight;
    CGFloat ballRadius;
    NSTimer *timer;
    CGFloat angle;
    BOOL check;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height;
    ballRadius = 32.0;
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(rollBall)
                                           userInfo:nil 
                                            repeats:true];
}

- (void)addBall {
    ball = [[UIImageView alloc] initWithFrame:CGRectMake(0, (self.view.bounds.size.height + statusNavigationBarHeight) / 2, 64.0, 64.0)];
    ball.image = [UIImage imageNamed:@"ball.png"];
    angle = 0.0;
    check = true;
    [self.view addSubview:ball];
}

- (void)rollBall {
    if (check) {
        angle += 4;
        ball.transform = CGAffineTransformMakeRotation(angle / 180 * M_PI);
        ball.center = CGPointMake(angle * ballRadius / 180 * M_PI, ball.center.y);
    } else {
        angle -= 4;
        ball.transform = CGAffineTransformMakeRotation(angle / 180 * M_PI);
        ball.center = CGPointMake(angle * ballRadius / 180 * M_PI, ball.center.y);
    }
    if (ball.center.x >= self.view.bounds.size.width - ballRadius + 10) {
        check = false;
    }
    if (ball.center.x <= ballRadius - 10) {
        check = true;
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
