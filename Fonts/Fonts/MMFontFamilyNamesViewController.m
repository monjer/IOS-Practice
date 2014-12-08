//
//  MMFontFamilyNamesViewController.m
//  Fonts
//
//  Created by manjunhan on 14-12-1.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFontFamilyNamesViewController.h"
#import "MMFNamesViewController.h"

@interface MMFontFamilyNamesViewController ()

@property (nonatomic) NSArray *familyNames ;
@property (nonatomic) NSIndexPath *selectedIndexPath ;

@end

@implementation MMFontFamilyNamesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _familyNames = [UIFont familyNames];
    NSArray *sortedArray = [_familyNames sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *str1 = obj1 , *str2 = obj2;
        return[str1 compare:str2];
    }];
    _familyNames = sortedArray ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _familyNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseID = @"reuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.textLabel.text = _familyNames[indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MMFNamesViewController *vc = (MMFNamesViewController*)segue.destinationViewController ;
    _selectedIndexPath = [self.tableView indexPathForSelectedRow];
    NSString *familyName =  _familyNames[_selectedIndexPath.row];
    vc.title = [NSString stringWithFormat:@"%@的字体",familyName];
    vc.familyName = familyName;
}

@end
