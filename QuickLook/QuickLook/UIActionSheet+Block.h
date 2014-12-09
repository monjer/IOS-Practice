//
//  UIActionSheet+Block.h
//  QuickLook
//
//  Created by manjunhan on 14-12-9.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionSheetClickBlock)(NSUInteger index);

@interface UIActionSheet (Block)<UIActionSheetDelegate>

@property (nonatomic,copy) ActionSheetClickBlock clickBlock;

+ (UIActionSheet*)showWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle
         destructiveButtonTitle:(NSString *)destructiveButtonTitle
              otherButtonTitles:(NSArray*)otherButtonTitles
               clickButtonBlock:(ActionSheetClickBlock)clickButtonBlock;
@end
