//
//  MMFlatButtonCell.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFlatButtonCell.h"

@interface MMFlatButtonCell()

@property (weak, nonatomic) IBOutlet MMFlatButton *button1;
@property (weak, nonatomic) IBOutlet MMFlatButton *button2;
@property (weak, nonatomic) IBOutlet MMFlatButton *button3;
@property (weak, nonatomic) IBOutlet MMFlatButton *button4;
@property (weak, nonatomic) IBOutlet MMFlatButton *button5;

@end

@implementation MMFlatButtonCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setFlatButtonType:(FlatButtonColorType)type
{
    [_button1 setFlatColorType:type];
    [_button2 setFlatColorType:type];
    [_button3 setFlatColorType:type];
    [_button4 setFlatColorType:type];
    [_button5 setFlatColorType:type];
}

@end
