//
//  MMFlatUIColorTableViewController.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFlatUIColorTableViewController.h"
#import "MMFlatUIColorTBDataSource.h"

@interface MMFlatUIColorTableViewController()

@property (nonatomic) MMFlatUIColorTBDataSource *dataSource;

@end

@implementation MMFlatUIColorTableViewController

- (void)viewDidLoad
{
    FlatColorCellConfiguration configuration = ^(MMFlatColor *color, MMFlatUIColorCell *cell, NSIndexPath *indexPath) {
        [cell setFlatColor:color];
    };
    
    _dataSource = [[MMFlatUIColorTBDataSource alloc]initWithCellConfiguration:configuration];
    
    [_dataSource loadData];
    
    self.tableView.dataSource = _dataSource;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
