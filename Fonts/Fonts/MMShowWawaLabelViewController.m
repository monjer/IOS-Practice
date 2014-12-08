//
//  MMShowWawaLabelViewController.m
//  Fonts
//
//  Created by manjunhan on 14-12-1.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMShowWawaLabelViewController.h"

#define WaWaFontOfSize(fontSize) [UIFont fontWithName:@"DFWaWaSC-W5" size:fontSize]
#define kCusLabelFrame CGRectMake(15,21,225,32)

@interface MMShowWawaLabelViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *secondCell;
@end

@implementation MMShowWawaLabelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _secondCell.textLabel.font = WaWaFontOfSize(32);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
