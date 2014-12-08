//
//  MMFlatButton.h
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FlatButtonColorType)
{
    kFlatButtonTurquoise = 0,
    kFlatButtonEmerland  = 1,
    kFlatButtonPeterRiver = 2,
    kFlatButtonAmethyst = 3,
    kFlatButtonWetAsphalt = 4,
    kFlatButtonGreenSea = 5,
    kFlatButtonNephritis = 6,
    kFlatButtonBelizeHole = 7,
    kFlatButtonWisteria = 8,
    kFlatButtonMidnightBlue = 9,
    kFlatButtonSunFlower = 10,
    kFlatButtonCarrot = 11,
    kFlatButtonAlizarin = 12,
    kFlatButtonConcrete = 13,
    kFlatButtonOrange = 14,
    kFlatButtonPumpkin = 15,
    kFlatButtonPomegranate = 16,
    kFlatButtonAsbestos = 17
};

@interface MMFlatButton : UIButton

@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) UIColor *borderColor;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) FlatButtonColorType type;

+ (id)flatButtonWithType:(FlatButtonColorType)type cornerRadius:(CGFloat)cornerRadius ;
- (id)initWithType:(FlatButtonColorType)type cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth;
- (void)setFlatColorType:(FlatButtonColorType)type ;

@end
