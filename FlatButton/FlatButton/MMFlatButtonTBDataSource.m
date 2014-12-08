//
//  MMFlatButtonTBDataSource.m
//  FlatButton
//
//  Created by manjunhan on 14-11-15.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFlatButtonTBDataSource.h"

#define kFlatButtonCellReuseID @"FlatButtonCell"

@interface MMFlatButtonTBDataSource()

@property (nonatomic,copy) FlatButtonCellConfiguration configuration ;

@end

@implementation MMFlatButtonTBDataSource

- (id)initWithCellConfiguration:(FlatButtonCellConfiguration) configuraion
{
    self = [super init];
    if(self){
        _configuration = configuraion ;
    }
    return self ;
}

- (void)loadData
{
    _data = @[
        @(kFlatButtonTurquoise),
        @(kFlatButtonEmerland),
        @(kFlatButtonPeterRiver),
        @(kFlatButtonAmethyst),
        @(kFlatButtonWetAsphalt),
        @(kFlatButtonGreenSea),
        @(kFlatButtonNephritis),
        @(kFlatButtonBelizeHole),
        @(kFlatButtonWisteria),
        @(kFlatButtonMidnightBlue),
        @(kFlatButtonSunFlower),
        @(kFlatButtonCarrot),
        @(kFlatButtonAlizarin),
        @(kFlatButtonConcrete),
        @(kFlatButtonOrange),
        @(kFlatButtonPumpkin),
        @(kFlatButtonPomegranate),
        @(kFlatButtonAsbestos)
    ];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMFlatButtonCell *cell =  [tableView dequeueReusableCellWithIdentifier:kFlatButtonCellReuseID forIndexPath:indexPath];
    if(!cell){
        cell = [[MMFlatButtonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kFlatButtonCellReuseID];
    }
    FlatButtonColorType type = [[_data objectAtIndex:indexPath.row] integerValue];
    _configuration(cell,type,indexPath);
    return cell;
}

@end
