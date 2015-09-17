//
//  ViewController.m
//  ButtonAnimation
//
//  Created by Rafael Fantini da Costa on 9/16/15.
//  Copyright © 2015 Rafael Fantini da Costa. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)barButtonPressed:(UITapGestureRecognizer *)gestureRecognizer {
    CircleView *tappedView = (CircleView *)gestureRecognizer.view;
    CircleView *burstView = [[CircleView alloc] initWithFrame:tappedView.frame];
    burstView.fillColor = tappedView.fillColor;
    
    [tappedView.superview addSubview:burstView];
    
    [UIView animateWithDuration:0.8f animations:^{
        burstView.transform = CGAffineTransformMakeScale(30.0f, 30.0f);
    } completion:^(BOOL finished) {
        ModalViewController *modal = [self.storyboard instantiateViewControllerWithIdentifier:@"modal"];
        modal.modalPresentationStyle = UIModalPresentationFullScreen;
        modal.view.backgroundColor = tappedView.fillColor;
        
        CATransition *transition = [CATransition animation];
        transition.duration = 0.35;
        transition.timingFunction =
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        UIView *containerView = self.view.window;
        [containerView.layer addAnimation:transition forKey:nil];
        [CATransaction commit];
        
        [self presentViewController:modal animated:NO completion:^{
            [burstView removeFromSuperview];
        }];
    }];
}

@end
