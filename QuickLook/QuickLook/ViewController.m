//
//  ViewController.m
//  QuickLook
//
//  Created by manjunhan on 14-12-8.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "ViewController.h"
#import "MMDataSource.h"
#import "AppDelegate.h"
#import "UIAlertView+Block.h"
#import "UIActionSheet+Block.h"
#import <QuickLook/QuickLook.h>

@interface ViewController ()<QLPreviewControllerDataSource>

@property (nonatomic) MMDataSource *dataSource;
@property (nonatomic) QLPreviewController *previewController ;
@property (nonatomic) NSUInteger curTapIndex ;

- (void)openApplicationURLNotificationHandler:(NSNotification*)notification ;
- (void)previewDocument;
- (void)deleteDocument:(NSInteger)index;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MMFileCellConfiguration configuration = ^(id cell, MMFileInfor *fileInfor, NSIndexPath *indexPath) {
        MMFileCell *fileCell = cell ;
        fileCell.fileInfor = fileInfor;
    };
    MMDataSource *dataSource = [[MMDataSource alloc] initWithCellReuseID:@"TableViewCell" configuration:configuration];
    _dataSource = dataSource ;
    
    self.tableView.dataSource = dataSource ;
    [_dataSource loadData:^{
        [self.tableView reloadData];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(openApplicationURLNotificationHandler:)
                                                 name:kUIApplicationDidOpenURLNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    void (^previewDocument)() = ^{
        [self previewDocument];
    };
    
    void (^deleteDocument)() = ^{
        [self deleteDocument:indexPath.row];
    };
    
    if(NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1){
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil
                                                                         message:nil
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"预览" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            previewDocument();
        }];
        
        [alertVC addAction:action];
        action = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive  handler:^(UIAlertAction *action) {
            deleteDocument();
        }];
        [alertVC addAction:action];
        
        [self presentViewController:alertVC animated:YES completion:nil];
        
    }else{
        
        UIActionSheet *actionSheet = [UIActionSheet showWithTitle:@"提示"
                                                cancelButtonTitle:nil
                                           destructiveButtonTitle:@"删除"
                                                otherButtonTitles:@[@"预览",@"取消"]
                                        clickButtonBlock:^(NSUInteger index) {
                                            if(index == 0){
                                                deleteDocument();
                                            } else if (index == 1) {
                                                previewDocument();
                                            }
                                        }];
        [actionSheet showFromRect:self.view.bounds inView:self.view animated:YES];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)openApplicationURLNotificationHandler:(NSNotification*)notification
{
    NSDictionary *userInfo = notification.userInfo;
    NSURL *url = userInfo[kDocumentURL];
    NSString *sourceApplication = userInfo[kSourceApplicationName];
    if(!sourceApplication){
        sourceApplication = @"第三方App";
    }
    
    void (^callback)() = ^(){
        [self.dataSource savePDFFile:[url path] completion:^{
            [self.tableView reloadData];
        }];
    };
    NSString *title = @"提示";
    NSString *message = [NSString stringWithFormat:@"接受到来自-%@-发送的PDF文档,确认插入?",sourceApplication];
    
    if(NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1){
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title
                                                                         message:message
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            callback();
        }];
        
        [alertVC addAction:action];
        action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertVC addAction:action];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }else{
      [UIAlertView showWithTitle:title message:message cancelButton:@"取消" otherButtons:@[@"确定"] clickAtButtonIndex:^(NSUInteger buttonIndex) {
          callback();
      }];
    }
}

- (void)previewDocument
{
    if(!_previewController){
        _previewController = [[QLPreviewController alloc]init];
        _previewController.dataSource = self ;
    }
    [self.navigationController pushViewController:_previewController animated:YES];
}

- (void)deleteDocument:(NSInteger)index
{
    [_dataSource deleteFileAtIndex:index compeltion:^{
        [self.tableView reloadData];
    }];
}

#pragma mark ----------------------- Q

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller;
{
    return [_dataSource numberOfDataSource];
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    MMFileInfor *fileInfor = [_dataSource fileInforAtIndex:index];
    return [fileInfor pathURL];
}

@end
