//
//  MMCustomFontsViewController.m
//  Fonts
//
//  Created by manjunhan on 14-12-1.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMCustomFontsViewController.h"
#import "MMShowViewController.h"

@interface MMCustomFontsViewController ()

@property (nonatomic) NSArray *appFontNames;
@property (nonatomic) NSString *selectedFontName ;

@end

@implementation MMCustomFontsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _appFontNames = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"UIAppFonts"];
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
    return _appFontNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"reuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    NSString *fontName = _appFontNames[indexPath.row];
    cell.textLabel.text = [fontName componentsSeparatedByString:@"."][0] ;
    cell.textLabel.font = [UIFont fontWithName:fontName size:12];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSString *fontName = _appFontNames[indexPath.row];
    _selectedFontName =[fontName componentsSeparatedByString:@"."][0];
    MMShowViewController *vc = (MMShowViewController*)segue.destinationViewController ;
    vc.customFontName = _selectedFontName ;
}

@end
