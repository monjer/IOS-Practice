//
//  UIView+IBRuntime.m
//  IBRuntimeAttribute
//
//  Created by manjunhan on 14-12-3.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "UIView+IBRuntime.h"

@implementation UIView (IBRuntime)

- (void)setBorderColor:(UIColor*)borderColor
{
    self.layer.borderColor = borderColor.CGColor ;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth ;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

- (void)setShadowColor:(UIColor*)shadowColor
{
    self.layer.shadowColor = shadowColor.CGColor ;
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
    self.layer.shadowOffset = shadowOffset ;
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity
{
    shadowOpacity = fabsf(shadowOpacity);
    shadowOpacity = MIN(shadowOpacity, 1);
    self.layer.shadowOpacity = shadowOpacity ;
}

@end
