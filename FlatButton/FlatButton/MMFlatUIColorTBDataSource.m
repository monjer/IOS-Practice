//
//  MMFlatUIColorTBDataSource.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFlatUIColorTBDataSource.h"

#define kTableViewReuseID @"ColorReuseID"

@interface MMFlatUIColorTBDataSource()

@property (nonatomic,copy) FlatColorCellConfiguration cellConfiguration;

@end
@implementation MMFlatUIColorTBDataSource

- (id)initWithCellConfiguration:(FlatColorCellConfiguration)cellConfiguration
{
    self = [super init];
    if(self){
        _cellConfiguration = cellConfiguration ;
    }
    return self;
}

- (void)loadData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"flat-colors" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _data = array;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMFlatUIColorCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewReuseID];
    NSDictionary *colorInfo =  [_data objectAtIndex:indexPath.row];
    MMFlatColor *color = [[MMFlatColor alloc]initWithColorInfo:colorInfo];
    if (!cell) {
        cell = [[MMFlatUIColorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewReuseID];
    }
    _cellConfiguration(color,cell,indexPath);
    return cell;
}

@end
