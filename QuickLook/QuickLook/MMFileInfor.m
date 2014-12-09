//
//  MMFileInfor.m
//  QuickLook
//
//  Created by manjunhan on 14-12-8.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFileInfor.h"

@implementation MMFileInfor

- (NSString*)dateString
{
    if (_createDate) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"YYYY-MM-DD hh:mm";
        return [formatter stringFromDate:_createDate];
    }
    return nil ;
}

- (NSString*)sizeString
{

    if(_fileSize){
        return [NSByteCountFormatter stringFromByteCount:[_fileSize intValue] countStyle:NSByteCountFormatterCountStyleFile ];
    }
    return nil ;
}

- (NSURL*)pathURL
{
    if(!_path){
        return nil ;
    }
    
    return [NSURL fileURLWithPath:_path];
}
@end
