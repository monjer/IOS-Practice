//
//  UIAlertView+Block.h
//  QuickLook
//
//  Created by manjunhan on 14-12-9.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertClickBlock)(NSUInteger buttonIndex);

@interface UIAlertView (Block)<UIAlertViewDelegate>

@property (nonatomic,copy) AlertClickBlock clickBlock;

+ (UIAlertView*)showWithTitle:(NSString*)title message:(NSString*)message
                 cancelButton:(NSString*)cancelButton otherButtons:(NSArray*)otherButtons
           clickAtButtonIndex:(AlertClickBlock)clickBlock;


@end
