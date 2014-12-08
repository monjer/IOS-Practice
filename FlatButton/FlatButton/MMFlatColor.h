//
//  MMFlatColor.h
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+FlatUIColor.h"

#define kFlatUIColorName @"name"
#define kFlatUIColorHexValue @"hex"
#define kFlatUIColorRGBValue @"rgb"

@interface MMFlatColor : NSObject

@property (nonatomic) NSString *name ;
@property (nonatomic) NSString *hex ;
@property (nonatomic) NSString *rgb ;

- (id)initWithColorInfo:(NSDictionary*)info;
- (UIColor*)flatColor;

@end
