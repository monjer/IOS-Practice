//
//  MMFlatUIButtonTableViewController.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFlatUIButtonTableViewController.h"
#import "MMFlatButtonTBDataSource.h"


@interface MMFlatUIButtonTableViewController ()

@property (nonatomic) MMFlatButtonTBDataSource *dataSource ;

@end

@implementation MMFlatUIButtonTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FlatButtonCellConfiguration configuration = ^(MMFlatButtonCell *cell, FlatButtonColorType type, NSIndexPath *indexPath) {
        [cell setFlatButtonType:type];
    };

    _dataSource = [[MMFlatButtonTBDataSource alloc]initWithCellConfiguration:configuration];
    [_dataSource loadData];
    self.tableView.dataSource = _dataSource ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




@end
