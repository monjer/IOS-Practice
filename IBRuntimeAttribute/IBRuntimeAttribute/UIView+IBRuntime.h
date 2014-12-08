//
//  UIView+IBRuntime.h
//  IBRuntimeAttribute
//
//  Created by manjunhan on 14-12-3.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IBRuntime)

- (void)setBorderColor:(UIColor*)borderColor;
- (void)setBorderWidth:(CGFloat)borderWidth;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setShadowColor:(UIColor*)shadowColor;
- (void)setShadowOffset:(CGSize)shadowOffset;
- (void)setShadowOpacity:(CGFloat)shadowOpacity;

@end
