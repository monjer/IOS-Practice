//
//  MMShowViewController.m
//  Fonts
//
//  Created by manjunhan on 14-12-1.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMShowViewController.h"

@interface MMShowViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (nonatomic) UIFont *font ;

@end

@implementation MMShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _font = [UIFont fontWithName:_customFontName size:14];
    UIFont *customFont = _font ;
    _label.font = customFont;
    _loginBtn.titleLabel.font = customFont ;
    _signUpBtn.titleLabel.font = customFont;
    NSDictionary *titleAttr = @{
                                NSFontAttributeName:customFont
                                };
    [_segment setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
    _textField.font = customFont ;
    _contentTextView.font = customFont ;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
