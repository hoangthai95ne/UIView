//
//  ViewController.m
//  FlyingBird
//
//  Created by Hoàng Thái on 3/5/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "FlyingBird.h"

@interface FlyingBird ()

@end

@implementation FlyingBird {
    UIImageView* jungle;
    UIImageView* bird;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self addBird];
    [self birdFlyDownAndUp];
}

- (void) drawJungle {
    jungle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    jungle.frame = self.view.bounds;
    jungle.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:jungle];
}

- (void) addBird {
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    NSMutableArray* birdImages = [NSMutableArray new];
    for (int i = 0; i <= 5; i++) {
        [birdImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"bird%d.png", i]]];
    }
    bird.animationImages = birdImages;
    bird.animationDuration = 0.7;
    bird.animationRepeatCount = 0;
    [self.view addSubview:bird];
    [bird startAnimating];
}

- (void) birdFlyDownAndUp {
    CGSize viewSize = self.view.bounds.size;
    [UIView animateWithDuration:2
                     animations:^{
                         bird.center = CGPointMake(viewSize.width, viewSize.height);
                     } completion:^(BOOL finished) {
                         bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1),
                                                                  CGAffineTransformMakeRotation(M_PI_4));
                         [UIView animateWithDuration:2
                                          animations:^{
                                              bird.center = CGPointMake(0, 0);
                                          } completion:^(BOOL finished) {
                                              bird.transform = CGAffineTransformIdentity;
                                              [self birdFlyDownAndUp];
                                          }];
                     }];
}

@end
