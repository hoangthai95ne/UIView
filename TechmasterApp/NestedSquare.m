//
//  ViewController.m
//  DrawNestedSquare
//
//  Created by Hoàng Thái on 3/5/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "NestedSquare.h"

@interface NestedSquare ()

@end

@implementation NestedSquare {
    CGFloat statusNavigationBarHeight;
    UIView* myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self drawNestedSquare];
    [self performSelector:@selector(rotateAllSquare) 
               withObject:nil 
               afterDelay:0.5];
    statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
}

-(void) drawNestedSquare {
    CGPoint center = CGPointMake(self.view.bounds.size.width / 2, (self.view.bounds.size.height + statusNavigationBarHeight) / 2);
    CGFloat margin = 20.0;
    CGFloat squareWidth = self.view.bounds.size.width - margin * 2;
    for (int i = 0; i < 10; i++) {
        UIView* square;
        if (i % 2 == 0) {
            square = [self drawSquareByWidth:squareWidth
                                   andRotate:false 
                                    atCenter:center];
        }
        else {
            square = [self drawSquareByWidth:squareWidth
                                   andRotate:true 
                                    atCenter:center];
        }
        [self.view addSubview:square];
        squareWidth *= 0.707;
    }
}

-(UIView*) drawSquareByWidth:(CGFloat) witdh 
                   andRotate:(BOOL) rotate 
                    atCenter:(CGPoint) center {
    UIView* square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, witdh, witdh)];
    square.backgroundColor = rotate ? [UIColor whiteColor] : [UIColor darkGrayColor];
    square.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    square.center = center;
    return square;
}

-(void) rotateAllSquare {
    [UIView animateWithDuration:1.0
                     animations:^{
                         for (int i = 0; i < 10; i++) {
                             if (i % 2 == 0) {
                                 ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI_4);
                             }
                             else {
                                 ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
                             };
                         };
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1.0
                                          animations:^{
                                              for (int i = 0; i < 10; i++) {
                                                  if (i % 2 == 0) {
                                                      ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
                                                  }
                                                  else {
                                                      ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI_4);
                                                  };
                                              };
                                          } completion:^(BOOL finished) {
                                              [self rotateAllSquare];
                                          }];
                     }];
}
     
@end

