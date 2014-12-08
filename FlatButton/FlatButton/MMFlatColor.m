//
//  MMFlatColor.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFlatColor.h"


@implementation MMFlatColor

- (id)initWithColorInfo:(NSDictionary*)info
{
    self = [super init];
    if(self){
        _name = [info objectForKey:kFlatUIColorName];
         _hex = [info objectForKey:kFlatUIColorHexValue];
         _rgb = [info objectForKey:kFlatUIColorRGBValue];
    }
    return self ;
}

- (UIColor*)flatColor
{
    return [UIColor colorFromHexString:_hex];
}

@end
