//
//  UIAlertView+Block.m
//  QuickLook
//
//  Created by manjunhan on 14-12-9.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>
#define kClickBlockKeyName @"kClickBlockKeyName"

@implementation UIAlertView (Block)
@dynamic clickBlock;

- (void)setClickBlock:(AlertClickBlock)clickBlock
{
    objc_setAssociatedObject(self, (__bridge const void*)kClickBlockKeyName, clickBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AlertClickBlock)getClickBlock
{
    return objc_getAssociatedObject(self, (__bridge const void*)kClickBlockKeyName);
}

+ (UIAlertView*)showWithTitle:(NSString*)title message:(NSString*)message
                 cancelButton:(NSString*)cancelButton otherButtons:(NSArray*)otherButtons
           clickAtButtonIndex:(void(^)(NSUInteger index))clickBlock
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButton otherButtonTitles:nil];
    if(otherButtons){
        for (int i = 0 ; i < otherButtons.count; i++) {
            [alert addButtonWithTitle:otherButtons[i]];
        }
    }
    alert.delegate = alert;
    [alert show];
    alert.clickBlock = clickBlock;
    return alert;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AlertClickBlock block = [self getClickBlock];
    if(block){
        block(buttonIndex);
        self.clickBlock = nil ;// 避免循环引用
    }
}

@end
