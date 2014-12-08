//
//  MMFlatUIColorCell.h
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMFlatColor.h"

@interface MMFlatUIColorCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
                    flatColor:(MMFlatColor*)flatColor;
- (void)setFlatColor:(MMFlatColor*)flatColor ;

@end
