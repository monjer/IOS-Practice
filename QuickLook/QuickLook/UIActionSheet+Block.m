//
//  UIActionSheet+Block.m
//  QuickLook
//
//  Created by manjunhan on 14-12-9.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "UIActionSheet+Block.h"
#import <objc/runtime.h>
#define kClickBlockKeyName @"kClickBlockKeyName"

@implementation UIActionSheet (Block)

@dynamic clickBlock;

- (void)setClickBlock:(ActionSheetClickBlock)clickBlock
{
    objc_setAssociatedObject(self, (__bridge const void*)kClickBlockKeyName, clickBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ActionSheetClickBlock)getClickBlock
{
    return objc_getAssociatedObject(self, (__bridge const void*)kClickBlockKeyName);
}

+ (UIActionSheet*)showWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle
         destructiveButtonTitle:(NSString *)destructiveButtonTitle
              otherButtonTitles:(NSArray*)otherButtonTitles
               clickButtonBlock:(ActionSheetClickBlock)clickButtonBlock
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:title delegate:nil cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles: nil];
    if(otherButtonTitles){
        for (int i = 0 ; i < otherButtonTitles.count; i++) {
            [actionSheet addButtonWithTitle:otherButtonTitles[i]];
        }
    }
    actionSheet.delegate = actionSheet ;
    actionSheet.clickBlock = clickButtonBlock ;
    return actionSheet;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ActionSheetClickBlock block = [self getClickBlock];
    if(block){
        block(buttonIndex);
        self.clickBlock = nil ;
    }
}

@end
