//
//  MMContentViewController.m
//  UIViewAnimationTransition
//
//  Created by manjunhan on 14-12-3.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMContentViewController.h"

@interface MMContentViewController ()

@end

@implementation MMContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)dismissViewController:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
