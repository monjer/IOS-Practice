//
//  MMBasicViewController.m
//  UIViewAnimationTransition
//
//  Created by manjunhan on 14-12-2.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMBasicViewController.h"

@interface MMBasicViewController ()
@property (weak, nonatomic) IBOutlet UIView *box;
@property (weak, nonatomic) IBOutlet UIButton *fadeInButton;
@property (weak, nonatomic) IBOutlet UIButton *fadeOutButton;

@end

@implementation MMBasicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _fadeInButton.enabled = NO ;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (IBAction)fadeIn:(id)sender
{
    _box.alpha = 0.0 ;
    _fadeInButton.enabled = NO;
      // or
    [UIView animateWithDuration:1.0 animations:^{
        _box.alpha = 1.0;
    } completion:^(BOOL finished) {
        _fadeOutButton.enabled = YES ;
    }];
    
}

- (IBAction)fadeOut:(id)sender
{
    _fadeOutButton.enabled = NO ;
    [UIView animateWithDuration:1.0 animations:^{
        _box.alpha = 0.0;
    } completion:^(BOOL finished) {
        _fadeInButton.enabled = YES ;
    }];
}

@end
