//
//  MMExecuteTransitionViewController.m
//  UIViewAnimationTransition
//
//  Created by manjunhan on 14-12-2.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMExecuteTransitionViewController.h"

@interface MMExecuteTransitionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) UIView *subViewA;
@property (nonatomic) UIView *subViewB;
@property (weak, nonatomic) IBOutlet UIView *wrapper;

@end

@implementation MMExecuteTransitionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.subViewA = [UIView new];
    self.subViewA.backgroundColor = [UIColor greenColor];
    [self.wrapper addSubview:self.subViewA];
    self.subViewB = [UIView new];
    self.subViewB.backgroundColor = [UIColor yellowColor];
    [self.wrapper addSubview:self.subViewB];
    _nameLabel.text = (NSString*)_transition[@"k"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _subViewA.frame = _wrapper.bounds ;
    _subViewB.frame = _wrapper.bounds ;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)beginTransition:(id)sender
{
    UIViewAnimationOptions animationOption = [(NSNumber*)_transition[@"v"] integerValue];
    _subViewA.frame = _wrapper.bounds ;
    _subViewB.frame = _wrapper.bounds ;
    [UIView transitionWithView:_wrapper
                      duration:1.0
                       options:animationOption
                    animations:^{
                        if (!_subViewB.window) {
                            [_subViewA removeFromSuperview];
                            [_wrapper addSubview:_subViewB];
                        }else{
                            [_subViewB removeFromSuperview];
                            [_wrapper addSubview:_subViewA];
                        }
                    }
                    completion:^(BOOL finished){
                        
                    }];
      // or
//    [UIView transitionFromView:_subViewB
//                        toView:_subViewA
//                      duration:1.0
//                       options:animationOption|UIViewAnimationOptionShowHideTransitionViews
//                    completion:^(BOOL finished) {
//                        _subViewB.hidden = NO ;
//    }];

}

@end
