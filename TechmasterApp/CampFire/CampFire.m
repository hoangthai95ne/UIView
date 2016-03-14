//
//  ViewController.m
//  CampFire
//
//  Created by Hoàng Thái on 3/5/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "CampFire.h"

@interface CampFire ()

@end

@implementation CampFire {
    UIImageView* campFire;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%lf", self.view.bounds.size.height);
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    NSLog(@"%lf", self.view.bounds.size.height);
    [self burnFire];
}

- (void) burnFire {
    campFire = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    NSMutableArray* images = [[NSMutableArray alloc] initWithCapacity:17];
    for (int i = 1; i <= 17; i++) {
        if (i < 10) {
            NSString* fileName = [NSString stringWithFormat:@"campFire0%d.gif", i];
            [images addObject:[UIImage imageNamed:fileName]];
        }
        else {
            NSString* fileName = [NSString stringWithFormat:@"campFire%d.gif", i];
            [images addObject:[UIImage imageNamed:fileName]];
        }
    }
    campFire.animationImages = images;
    campFire.animationDuration = 1;
    campFire.animationRepeatCount = 0;
    [self.view addSubview:campFire];
    [campFire startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
