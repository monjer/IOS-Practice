//
//  MMUserInfoVIewController.m
//  IBRuntimeAttribute
//
//  Created by manjunhan on 14-12-4.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMUserInfoVIewController.h"
#import "MMCirclePosterImageView.h"

@interface MMUserInfoVIewController()

@property (weak, nonatomic) IBOutlet MMCirclePosterImageView *avartImageView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic) CGFloat max ;

@end
@implementation MMUserInfoVIewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _max = 100 ;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews
{
    _avartImageView.bounds = CGRectMake(0, 0, 60, 60);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat top = fabs(scrollView.contentOffset.y);
    top-=64;
    
    CGFloat percentage = fabs(top/_max);
    _avartImageView.percentage = percentage ;
}

@end
