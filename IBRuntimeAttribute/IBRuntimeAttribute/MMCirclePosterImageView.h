//
//  MMCirclePosterImageView.h
//  IBRuntimeAttribute
//
//  Created by manjunhan on 14-12-4.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMCirclePosterImageView : UIImageView

@property (nonatomic) CGFloat circleLineWidth;
@property (nonatomic) UIColor *circleLineColor ;
@property (nonatomic) UIColor *pecentageCircleLineColor;
@property (nonatomic) CGFloat percentage;

- (void)setPercentage:(CGFloat)percentage animated:(BOOL)animated;

@end
