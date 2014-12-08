//
//  ViewController.m
//  Fonts
//
//  Created by manjunhan on 14-12-1.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "ViewController.h"
#import "MMSysFontInfoViewController.h"
#import "MMFontFamilyNamesViewController.h"
#import "MMCustomFontsViewController.h"
#import "MMShowWawaLabelViewController.h"

#define StoryBoardFromMainBundle(storyboardName) [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]]
#define StoryBoardFromBundle(stroyboardName,fromBundle) [UIStoryboard storyboardWithName:storyboardName bundle:fromBundle]

    
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *dataSource ;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataSource = @[
        @"系统字体信息",
        @"系统Font Family名称",
        @"自定义字体",
        @"嵌入字体"
    ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellReuseIdentifier = @"CellReuseIdentifier" ;
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellReuseIdentifier];
    }
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    return cell ;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *board = StoryBoardFromMainBundle(@"Main");
    UIViewController *vc ;
    switch (indexPath.row) {
        case 0:
        {
            vc = [board instantiateViewControllerWithIdentifier:@"MMSysFontInfoViewController"];
            break;
        }
        case 1:
        {
            vc = [board instantiateViewControllerWithIdentifier:@"MMFontFamilyNamesViewController"];        
            break;
        }
        case 2:
        {
            vc = [board instantiateViewControllerWithIdentifier:@"MMCustomFontsViewController"];
            break;
        }
        case 3:
        {
            vc = [board instantiateViewControllerWithIdentifier:@"MMShowWawaLabelViewController"];
            break;
        }
        default:
            break;
    }
    vc.title = _dataSource[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
