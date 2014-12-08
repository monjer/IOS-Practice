//
//  ViewController.m
//  MessageUI
//
//  Created by manjunhan on 14-12-8.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController ()<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

- (void)sendEmail;
- (void)sendMessage;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)sendEmail
{
    if(![MFMailComposeViewController canSendMail]){
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"邮箱不可用，请在“设置“中添加邮箱账户。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alertVC addAction:action];
        [self presentViewController:alertVC animated:YES completion:nil];
        return;
    }
    
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    [picker setSubject:@"邮件主题"];
    // 设置收信人地址
    NSArray *toRecipients = @[@"first@example.com"]; // 收件人列表
    NSArray *ccRecipients = @[@"second@example.com",@"third@example.com"];//抄送人列表
    NSArray *bccRecipients = @[@"four@example.com"];
    [picker setToRecipients:toRecipients];
    [picker setCcRecipients:ccRecipients];
    [picker setBccRecipients:bccRecipients];
    // 设置邮件内容
    NSString *path = [[NSBundle mainBundle] pathForResource:@"App_Store_Distribution_and_Marketing_for_Apps" ofType:@"pdf"];
    NSData *myData = [NSData dataWithContentsOfFile:path];
    [picker addAttachmentData:myData mimeType:@"application/pdf" fileName:@"App_Store_Distribution_and_Marketing_for_Apps.pdf"]; // 添加附件
    NSString *emailBody = @"邮件内容。";
    [picker setMessageBody:emailBody isHTML:NO];//设置邮件内容是否是HTML，默认为纯文本
    
    [self presentViewController:picker animated:YES completion:nil];

}

- (void)sendMessage
{
//    [MFMessageComposeViewController canSendSubject]; // 是否可发送主题，iMessage配置项
//    [MFMessageComposeViewController canSendAttachments];//是否可发送附件，iMessage配置项
    if(![MFMessageComposeViewController canSendText]){// 是否可发送文本消息，iMessage配置项
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"iMessage不可用，请在“设置”中开启iMessage。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alertVC addAction:action];
        [self presentViewController:alertVC animated:YES completion:nil];
        return;
        return;
    }
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    picker.messageComposeDelegate = self;
    [picker disableUserAttachments];//禁止添加附件，start from ios7
    picker.body = @"imessage 消息内容。";
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark ----------------- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self sendEmail];
            break;
        case 1:
            [self sendMessage];
            break;
    }
}

#pragma mark ----------------- MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        // 取消发送
        case MFMailComposeResultCancelled:
            break;
        // 保存草稿
        case MFMailComposeResultSaved:
            break;
        // 发送成功
        case MFMailComposeResultSent:
            break;
        // 发送失败
        case MFMailComposeResultFailed:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ----------------- MFMessageComposeViewControllerDelegate

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        // 取消发送
        case MessageComposeResultCancelled:
            break;
        // 保存成功
        case MessageComposeResultSent:
            break;
        // 发送失败
        case MessageComposeResultFailed:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
