//
//  MMFileInfor.h
//  QuickLook
//
//  Created by manjunhan on 14-12-8.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMFileInfor : NSObject

@property (nonatomic) NSString *fileName ;
@property (nonatomic) NSNumber *fileSize;
@property (nonatomic) NSDate *createDate ;
@property (nonatomic) NSString *path ;

- (NSString*)dateString;
- (NSString*)sizeString ;
- (NSURL*)pathURL ;

@end
