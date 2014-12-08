//
//  MMFlatButton.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFlatButton.h"
#import "UIColor+FlatUIColor.h"

#define kDefaultFlatButtonBorderWidth 1
#define kDefaultFlatButtonCornerRadius 3
#define kDefaultFlatButtonBorderColor

static NSDictionary *colorTypeOfValues = nil ;

@interface MMFlatButton()

- (void)commitInit ;

@end

@implementation MMFlatButton

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
    UIImage *highlightBackgroundImage = [self highlightBackgroundImage];
    [self setTitleColor:_borderColor forState:UIControlStateNormal];
    [self setBackgroundImage:highlightBackgroundImage forState:UIControlStateHighlighted];
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth ;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius ;
}

+ (id)flatButtonWithType:(FlatButtonColorType)type cornerRadius:(CGFloat)cornerRadius
{
    MMFlatButton *button = [MMFlatButton buttonWithType:UIButtonTypeCustom];
    
    return button;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self commitInit];
}

- (id)init
{
    self = [super init];
    if(self){
        [self commitInit];
    }
    return self ;
}

- (id)initWithType:(FlatButtonColorType)type cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth
{
    self = [self init];
    if(self){
        self.cornerRadius = cornerRadius;
        self.borderWidth = borderWidth ;
        [self setFlatColorType:type];
    }
    return self;
}

- (void)commitInit
{
    if(!colorTypeOfValues){
        colorTypeOfValues = @{
            @(kFlatButtonTurquoise):@"#1ABC9C",
            @(kFlatButtonEmerland):@"#2ECC71",
            @(kFlatButtonPeterRiver):@"#3498DB",
            @(kFlatButtonAmethyst):@"#9B59B6",
            @(kFlatButtonWetAsphalt):@"#34495E",
            @(kFlatButtonGreenSea):@"#16A085",
            @(kFlatButtonNephritis):@"#2ECC71",
            @(kFlatButtonBelizeHole):@"#2980B9",
            @(kFlatButtonWisteria):@"#8E44AD",
            @(kFlatButtonMidnightBlue):@"#2C3E50",
            @(kFlatButtonSunFlower):@"#F1C40F",
            @(kFlatButtonCarrot):@"#E67E22",
            @(kFlatButtonAlizarin):@"#E74C3C",
            @(kFlatButtonConcrete):@"#95A5A6",
            @(kFlatButtonOrange):@"#F39C12",
            @(kFlatButtonPumpkin):@"#D35400",
            @(kFlatButtonPomegranate):@"#C0392B",
            @(kFlatButtonAsbestos):@"#7F8C8D"
        };
    }
    self.layer.cornerRadius = kDefaultFlatButtonCornerRadius ;
    self.layer.borderWidth = kDefaultFlatButtonBorderWidth ;
    self.layer.masksToBounds = YES ;
    self.backgroundColor = [UIColor clearColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    if(!self.enabled){
        self.layer.opacity = 0.5;
    }else{
        self.layer.opacity = 1;
    }
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if(!self.enabled){
        self.layer.opacity = 0.5;
    }else{
        self.layer.opacity = 1;
    }
}

- (void)setFlatColorType:(FlatButtonColorType)type
{
    NSString *colorHex = (NSString*)colorTypeOfValues[@(type)];
    UIColor *flatColor = [UIColor colorFromHexString:colorHex];
    self.borderColor = flatColor;
}

- (UIImage*)highlightBackgroundImage
{
    CGSize size = self.frame.size ;
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGRect fillRect = CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(currentContext, _borderColor.CGColor);
    CGContextFillRect(currentContext, fillRect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
