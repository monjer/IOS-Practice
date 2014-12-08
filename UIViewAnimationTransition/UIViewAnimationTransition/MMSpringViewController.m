//
//  MMSpringViewController.m
//  UIViewAnimationTransition
//
//  Created by manjunhan on 14-12-3.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMSpringViewController.h"
#import "UIView+Dimensions.h"

@interface MMSpringViewController ()

@property (nonatomic) CGFloat velocity;
@property (nonatomic) CGFloat dampingRatio;
@property (weak, nonatomic) IBOutlet UIView *animatedBox;
@property (weak, nonatomic) IBOutlet UIButton *exeButton;

@end

@implementation MMSpringViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dampingRatio = 0.5 ;
    _velocity = 0.5 ;
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _animatedBox.frame = CGRectMake(0, 0, 100, 100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)velocityChanged:(UISlider *)sender
{
    _velocity = sender.value;
}

- (IBAction)dampingRatioChanged:(UISlider *)sender
{
    _dampingRatio = sender.value ;
}

- (IBAction)startAnimation:(id)sender
{
    _exeButton.enabled = NO ;
    _animatedBox.y += _animatedBox.height ;
    [UIView animateWithDuration:.8 delay:0.0 usingSpringWithDamping:_dampingRatio
          initialSpringVelocity:_velocity options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _animatedBox.y = self.view.height-_animatedBox.height;
    } completion:^(BOOL finished) {
        _exeButton.enabled = YES ;
    }];
}
@end
