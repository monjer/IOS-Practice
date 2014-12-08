//
//  MMViewTransitionStyleViewController.m
//  UIViewAnimationTransition
//
//  Created by manjunhan on 14-12-2.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMViewTransitionStyleViewController.h"
#import "MMExecuteTransitionViewController.h"

@interface MMViewTransitionStyleViewController ()

@property (nonatomic) NSArray *dataSource ;

@end

@implementation MMViewTransitionStyleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _dataSource = @[
        @{@"k":@"UIViewAnimationOptionTransitionFlipFromLeft",@"v":@(UIViewAnimationOptionTransitionFlipFromLeft)},
        @{@"k":@"UIViewAnimationOptionTransitionFlipFromRight",@"v":@(UIViewAnimationOptionTransitionFlipFromRight)},
        @{@"k":@"UIViewAnimationOptionTransitionCurlUp",@"v":@(UIViewAnimationOptionTransitionCurlUp)},
        @{@"k":@"UIViewAnimationOptionTransitionCurlDown",@"v":@(UIViewAnimationOptionTransitionCurlDown)},
        @{@"k":@"UIViewAnimationOptionTransitionCrossDissolve",@"v":@(UIViewAnimationOptionTransitionCrossDissolve)},
        @{@"k":@"UIViewAnimationOptionTransitionFlipFromTop",@"v":@(UIViewAnimationOptionTransitionFlipFromTop)},
        @{@"k":@"UIViewAnimationOptionTransitionFlipFromBottom",@"v":@(UIViewAnimationOptionTransitionFlipFromBottom)}

   ];
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
    return _dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellReuseID = @"cellReuseID";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseID];
    NSDictionary *item = _dataSource[indexPath.row];
    cell.textLabel.text = item[@"k"];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    return cell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = _dataSource[indexPath.row];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MMExecuteTransitionViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"MMExecuteTransitionViewController"];
    vc.transition = item ;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
