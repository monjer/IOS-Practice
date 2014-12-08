//
//  MMCirclePosterImageView.m
//  IBRuntimeAttribute
//
//  Created by manjunhan on 14-12-4.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMCirclePosterImageView.h"
#import <QuartzCore/QuartzCore.h>

#define kDefaultCircleLineColor [UIColor lightGrayColor]
#define kDefaultCircleLineWidth 1.0

@interface MMCirclePosterImageView()

@property (nonatomic) CAShapeLayer *circle;
@property (nonatomic) CAShapeLayer *animatedCircle;
@property (nonatomic) CGFloat start;
@property (nonatomic) CGFloat end;

- (void)commitInit ;

@end

@implementation MMCirclePosterImageView

- (void)setCircleLineColor:(UIColor *)circleLineColor
{
    _circleLineColor = circleLineColor;
    _circle.strokeColor = circleLineColor.CGColor;
}

- (void)setCircleLineWidth:(CGFloat)circleLineWidth
{
    _circleLineWidth = circleLineWidth ;
    _circle.lineWidth = circleLineWidth;
    [self refreshAnimatedCircleLayerPath];
    [self refreshCircleLayerPath];
}

- (void)setPecentageCircleLineColor:(UIColor *)pecentageCircleLineColor
{
    _pecentageCircleLineColor = pecentageCircleLineColor ;
    _animatedCircle.strokeColor = pecentageCircleLineColor.CGColor ;
}

- (void)setPercentage:(CGFloat)percentage
{
    _percentage = percentage ;
    [self setPercentage:percentage animated:NO];
}

- (void)setPercentage:(CGFloat)percentage animated:(BOOL)animated
{
    _percentage = percentage;
    
    if (!_animatedCircle) {
        _animatedCircle = [[CAShapeLayer alloc]init];
        _animatedCircle.lineWidth = _circleLineWidth ;
        _animatedCircle.strokeColor = _pecentageCircleLineColor.CGColor ;
        _animatedCircle.fillColor = [UIColor clearColor].CGColor ;
        _animatedCircle.lineCap = kCALineCapRound ;
        [self.layer addSublayer:_animatedCircle];
    }

    [self refreshAnimatedCircleLayerPath];
    
    if(animated){
        // Configure animation
        CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        drawAnimation.duration            = 1.0; // "animate over 10 seconds or so.."
        drawAnimation.repeatCount         = 1.0; // Animate only once..
        drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
        drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
        // Add the animation to the circle
        [_animatedCircle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
    }
}

- (id)init
{
    self = [super init];
    if(self){
        [self commitInit];
    }
    return self ;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self refreshCircleLayerPath];
    [self refreshAnimatedCircleLayerPath];
    self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2.0;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self commitInit];
}

- (void)commitInit
{
    _circle = [[CAShapeLayer alloc]init];
    _circle.lineWidth = _circleLineWidth ;
    _circle.strokeColor = _circleLineColor.CGColor ;
    _circle.fillColor = [UIColor clearColor].CGColor ;
    [self.layer addSublayer:_circle];
    
    [self refreshCircleLayerPath];

    self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2.0;
    self.layer.masksToBounds = YES ;
}

- (void)refreshCircleLayerPath
{
    CGFloat radius = CGRectGetHeight(self.bounds)/2.0 - _circleLineWidth/2.0;
    CGRect rect = CGRectInset(self.bounds , _circleLineWidth/2.0 , _circleLineWidth/2.0);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    _circle.path = circlePath.CGPath ;
}

- (void)refreshAnimatedCircleLayerPath
{
    CGFloat startAngle = M_PI*3/2 , endAngle=startAngle+M_PI*2*_percentage;
    CGPoint centerPt ;
    CGFloat radius = CGRectGetHeight(self.bounds)/2.0 - _circleLineWidth/2;
    centerPt.x = CGRectGetHeight(self.bounds)/2.0;
    centerPt.y = CGRectGetWidth(self.bounds)/2.0;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:centerPt radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    _animatedCircle.path = circlePath.CGPath ;

}
@end
