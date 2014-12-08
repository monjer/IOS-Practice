//
//  MMSysFontInfoViewController.m
//  Fonts
//
//  Created by manjunhan on 14-12-1.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMSysFontInfoViewController.h"

@interface MMSysFontInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelFontSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *buttonFontSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *systemFontSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *smallSystemFontSizeLabel;

@end

@implementation MMSysFontInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _labelFontSizeLabel.text = [NSString stringWithFormat:@"%0.f", [UIFont labelFontSize]];
    _buttonFontSizeLabel.text = [NSString stringWithFormat:@"%0.f", [UIFont buttonFontSize]];
    _systemFontSizeLabel.text = [NSString stringWithFormat:@"%0.f", [UIFont systemFontSize]];
    _smallSystemFontSizeLabel.text = [NSString stringWithFormat:@"%0.f", [UIFont smallSystemFontSize]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
