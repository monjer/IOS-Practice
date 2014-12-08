//
//  MMFlatButtonTBDataSource.h
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MMFlatButtonCell.h"

typedef void(^FlatButtonCellConfiguration)(MMFlatButtonCell *cell , FlatButtonColorType type , NSIndexPath *indexPath);

@interface MMFlatButtonTBDataSource : NSObject<UITableViewDataSource>

@property (nonatomic) NSArray *data ;

- (id)initWithCellConfiguration:(FlatButtonCellConfiguration) configuraion ;
- (void)loadData ;

@end
