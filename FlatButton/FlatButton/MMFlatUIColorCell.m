//
//  MMFlatUIColorCell.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFlatUIColorCell.h"

@interface MMFlatUIColorCell()

@property (weak, nonatomic) IBOutlet UILabel *rgbLabel;
@property (weak, nonatomic) IBOutlet UILabel *hexLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorNameLabel;
@property (weak, nonatomic) IBOutlet UIView *colorBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *hexTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *rgbTitleLabel;

@property (nonatomic) MMFlatColor *flatColor ;

@end

@implementation MMFlatUIColorCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
                    flatColor:(MMFlatColor*)flatColor
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setFlatColor:flatColor];
        self.backgroundView = [UIView new];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    _rgbLabel.text = _flatColor.rgb;
    _colorNameLabel.text = _flatColor.name ;
    _hexLabel.text = _flatColor.hex ;
    _colorBackgroundView.backgroundColor = [_flatColor flatColor];
}

- (void)setHighlighted:(BOOL)highlighted
              animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    UIColor *textColor;
    if(highlighted){
        textColor = [UIColor blackColor];
    }else{
        textColor = [UIColor whiteColor];
    }
    _rgbLabel.textColor = textColor ;
    _colorNameLabel.textColor = textColor ;
    _hexLabel.textColor = textColor ;
    _hexTitleLabel.textColor = textColor ;
    _rgbTitleLabel.textColor = textColor ;
}

- (void)setFlatColor:(MMFlatColor*)flatColor
{
    _flatColor = flatColor ;
    _rgbLabel.text = _flatColor.rgb;
    _colorNameLabel.text = _flatColor.name ;
    _hexLabel.text = _flatColor.hex ;
    self.backgroundColor = [_flatColor flatColor];

}

@end
