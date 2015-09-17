//
//  ModalViewController.m
//  ButtonAnimation
//
//  Created by Rafael Fantini da Costa on 9/16/15.
//  Copyright © 2015 Rafael Fantini da Costa. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)exitPressed:(UITapGestureRecognizer *)gestureRecognizer {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.35;
    transition.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.type = kCATransitionFade;
    
    UIView *containerView = self.view.window;
    [containerView.layer addAnimation:transition forKey:nil];
    [CATransaction commit];
    
    [self dismissViewControllerAnimated:NO completion:nil];
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
