//
//  AppDelegate.h
//  QuickLook
//
//  Created by manjunhan on 14-12-8.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kDocumentURL;
extern NSString *const kSourceApplicationName;
extern NSString *const kUIApplicationDidOpenURLNotification;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

