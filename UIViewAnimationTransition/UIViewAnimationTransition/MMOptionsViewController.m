//
//  MMOptionsViewController.m
//  UIViewAnimationTransition
//
//  Created by manjunhan on 14-12-2.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMOptionsViewController.h"

#define kPanelBounds CGRectMake(0,0,150,250)

@interface MMOptionsViewController ()

@property (weak, nonatomic) UIView *panel;
@property (nonatomic) UIViewAnimationOptions curOptions;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segement;

@property (weak, nonatomic) IBOutlet UIButton *slideInButton;
@end

@implementation MMOptionsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _curOptions = UIViewAnimationOptionCurveEaseInOut;
    self.view.autoresizingMask = UIViewAutoresizingNone;
    UIFont *font = [UIFont systemFontOfSize:8];
    NSDictionary *titleAttr = @{
        NSFontAttributeName:font
    };
    
    [_segement setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
    
    UIView *panel = [UIView new];
    panel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:panel];
    _panel = panel ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CGRect frame = kPanelBounds;
    CGFloat x = (CGRectGetWidth(self.view.bounds) - CGRectGetWidth(kPanelBounds))/2.0 ,
    y = (CGRectGetHeight(self.view.bounds) - CGRectGetHeight(kPanelBounds));
    frame.origin.x = x ;
    frame.origin.y = y ;
    _panel.frame = frame;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)slideInPanel:(id)sender
{
    CGFloat height = CGRectGetHeight(kPanelBounds);
    __block CGRect frame = _panel.frame ;
    frame.origin.y += height ;
    _panel.frame = frame ;
    
    _slideInButton.enabled = NO ;
    [UIView animateWithDuration:1.0 delay:0.0 options:_curOptions animations:^{
        frame.origin.y -= height;
        _panel.frame = frame ;
    } completion:^(BOOL finished) {
        _slideInButton.enabled = YES ;
    }];
}

- (IBAction)changeAnimationOption:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            _curOptions = UIViewAnimationOptionCurveEaseInOut; // 加速度递增--> 递减
            break;
        case 1:
            _curOptions = UIViewAnimationOptionCurveEaseIn; // 加速度递增
            break;
        case 2:
            _curOptions = UIViewAnimationOptionCurveLinear; // 匀速
            break;
        case 3:
            _curOptions = UIViewAnimationOptionCurveEaseOut;// 加速度递减
            break;
    }
}

- (void)removeAllConstraintsOfSubview:(UIView*)subView
{
    NSArray *constraints = self.view.constraints ;
    for (NSLayoutConstraint *constraint in constraints) {
        if (constraint.firstItem == subView || constraint.secondItem == subView) {
            [self.view removeConstraint:constraint];
        }
    }
    [self.view updateConstraintsIfNeeded];
//    [self.view layoutIfNeeded];
}

@end
