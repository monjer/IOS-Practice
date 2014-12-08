//
//  ViewController.m
//  AlertController
//
//  Created by manjunhan on 14-12-5.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()<UITextFieldDelegate>

@property (nonatomic) NSRegularExpression *regularValidator ;
@property (nonatomic) UIAlertAction *action ;
@property (nonatomic) UITextField *textField ;

- (void)showDefaultActionSheet;
- (void)showActionSheetWithOkAndCancel;
- (void)showActionSheetWithOKAndDestroy;
- (void)showActionList;

- (void)showDefaultAlertView;
- (void)showConfirmAlertView ;
- (void)showMessageAlertView ;
- (void)showLoginAlertView ;
- (void)showWarnigAlertView ;
- (void)showChoiceListAlertView ;
- (void)showReinputPasswordAlertView ;
- (void)showInputEmailAlertView ;
- (void)showChangePasswordAlertView ;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *emailPattern = @"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
    NSError *error;
    _regularValidator = [NSRegularExpression
                         regularExpressionWithPattern:emailPattern
                         options:NSRegularExpressionAnchorsMatchLines
                         error:&error];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                [self showDefaultActionSheet];
            }else if(indexPath.row == 1){
                [self showActionSheetWithOkAndCancel];
            }else if(indexPath.row == 2){
                [self showActionSheetWithOKAndDestroy];
            }else if(indexPath.row == 3){
                [self showActionList];
            }
            break;
            
        case 1:
            if(indexPath.row == 0){
                [self showDefaultAlertView];
            }else if(indexPath.row == 1){
                [self showConfirmAlertView];
            }else if(indexPath.row == 2){
                [self showMessageAlertView];
            }else if (indexPath.row == 3){
                [self showLoginAlertView];
            }else if(indexPath.row == 4){
                [self showWarnigAlertView];
            }else if(indexPath.row == 5){
                [self showChoiceListAlertView];
            }else if(indexPath.row == 6){
                [self showReinputPasswordAlertView];
            }else if (indexPath.row == 7){
                [self showInputEmailAlertView];
            }else if(indexPath.row == 8){
                [self showChangePasswordAlertView];
            }
            break;
            
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark ------------------------------------- Action Sheet

- (void)showDefaultActionSheet
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Title"
                                                                      message:@"action message" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

- (void)showActionSheetWithOkAndCancel
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Title"
                                                                      message:@"action message" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleCancel
                                    handler:^(UIAlertAction *action) {
                                    }];
    
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

- (void)showActionSheetWithOKAndDestroy
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Title"
                                                                      message:@"action message" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Confirm"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Delete"
                                      style:UIAlertActionStyleDestructive
                                    handler:^(UIAlertAction *action) {
                                    }];
    
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleCancel
                                    handler:^(UIAlertAction *action) {
                                    }];
    
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

- (void)showActionList
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Title"
                                                                      message:@"action message" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Copy"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cut"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                        
                                    }];
    
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Open in Safari"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                        
                                    }];
    
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleCancel
                                    handler:^(UIAlertAction *action) {
                                        
                                    }];
    
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

#pragma mark ------------------------------------- AlertView

- (void)showDefaultAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Title"
                                                                      message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Copy"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

- (void)showConfirmAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Title"
                                                                      message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Confirm"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
    
}

- (void)showMessageAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@""
                                                                      message:@"This is a message ." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

- (void)showLoginAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@""
                                                                      message:@"Please input your infor"
                                                               preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    [actionVC addAction:action];
    
    [actionVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"username";
        textField.borderStyle = UITextBorderStyleNone;
    }];
    [actionVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"password";
        textField.secureTextEntry = YES ;
        textField.borderStyle = UITextBorderStyleNone;        
    }];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

- (void)showWarnigAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                      message:@"Sure to delete ?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Delete"
                                                     style:UIAlertActionStyleDestructive
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
    
}

- (void)showChoiceListAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Note"
                                                                      message:@"Make a choice." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Go to download."
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    action = [UIAlertAction actionWithTitle:@"Give a five star."
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    [actionVC addAction:action];
    action = [UIAlertAction actionWithTitle:@"Reject."
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    [actionVC addAction:action];
    
    [self presentViewController:actionVC animated:YES completion:nil];
    
}
- (void)showReinputPasswordAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Note"
                                                                      message:@"Please reinput your password."
                                                               preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    [actionVC addAction:action];
    
    [actionVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"password";
        textField.secureTextEntry = YES ;
    }];
    
    [self presentViewController:actionVC animated:YES completion:nil];
    
}

- (void)showInputEmailAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@"Note"
                                                                      message:@"Please input your email address ."
                                                               preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    action.enabled = NO ;
    _action = action;
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    
    
    [actionVC addAction:action];
    
    [actionVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"e-mail";
        textField.keyboardType = UIKeyboardTypeEmailAddress ;
        textField.delegate = self;
        _textField = textField ;
        
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    [self presentViewController:actionVC animated:YES completion:nil];
    
}


- (void)textDidChange:(NSDictionary*)infor
{
    NSString *text = _textField.text ;
    NSLog(@"%@",text);
    NSUInteger matchNum = [_regularValidator numberOfMatchesInString:text
                                                             options:0
                                                               range:NSMakeRange(0,text.length)];
    if (matchNum == 0) {
        _action.enabled = NO ;
    }else{
        _action.enabled = YES ;
    }
    
}

- (void)showChangePasswordAlertView
{
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:@""
                                                                      message:@"Change your password."
                                                               preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                   }];
    [actionVC addAction:action];
    
    action = [UIAlertAction actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                    }];
    [actionVC addAction:action];
    
    [actionVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"old password";
        textField.borderStyle = UITextBorderStyleNone;
        textField.layer.borderColor = [UIColor redColor].CGColor;
        textField.layer.borderWidth = 1.0 ;
        textField.secureTextEntry = YES ;
    }];
    [actionVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"new password";
        textField.borderStyle = UITextBorderStyleNone;
        textField.secureTextEntry = YES ;
    }];
    [actionVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"confirm new password";
        textField.borderStyle = UITextBorderStyleNone;
        textField.secureTextEntry = YES ;
    }];
    
    [self presentViewController:actionVC animated:YES completion:nil];
}

@end
