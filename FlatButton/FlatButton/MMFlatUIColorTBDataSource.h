//
//  MMFlatUIColorTBDataSource.h
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MMFlatColor.h"
#import "MMFlatUIColorCell.h"

typedef void(^FlatColorCellConfiguration)(MMFlatColor *color , MMFlatUIColorCell *cell , NSIndexPath *indexPath) ;

@interface MMFlatUIColorTBDataSource : NSObject<UITableViewDataSource>

@property (nonatomic) NSArray *data ;

- (id)initWithCellConfiguration:(FlatColorCellConfiguration)cellConfiguration;
- (void)loadData;

@end
