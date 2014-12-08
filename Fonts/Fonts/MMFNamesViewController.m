//
//  MMFNamesViewController.m
//  Fonts
//
//  Created by manjunhan on 14-12-1.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFNamesViewController.h"

@interface MMFNamesViewController ()

@property (nonatomic) NSArray *fontNamesOfFamily;

@end

@implementation MMFNamesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _fontNamesOfFamily = [UIFont fontNamesForFamilyName:_familyName];
    [_fontNamesOfFamily enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@",obj);
    }];
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
    return _fontNamesOfFamily.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"reuseID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSString *fontName = _fontNamesOfFamily[indexPath.row];
    
    cell.textLabel.text = fontName ;
    cell.textLabel.font = [UIFont fontWithName:fontName size:12];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
