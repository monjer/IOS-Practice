//
//  MMDataSource.h
//  QuickLook
//
//  Created by manjunhan on 14-12-8.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MMFileInfor.h"
#import "MMFileCell.h"

typedef void (^MMFileCellConfiguration)(id cell , MMFileInfor *fileInfor , NSIndexPath *indexPath);

@interface MMDataSource : NSObject<UITableViewDataSource>

@property (nonatomic) NSMutableArray *fileInfos;
@property (nonatomic) NSString *cellReuseId;
@property (nonatomic,copy) MMFileCellConfiguration configuration ;

- (instancetype)initWithCellReuseID:(NSString*)reuseID configuration:(MMFileCellConfiguration)configuration ;

- (void)loadData:(void(^)())completion;
- (MMFileInfor*)getFileInforOfIndex:(NSUInteger)index;
- (void)savePDFFile:(NSString*)pdfFilePath completion:(void(^)())completion;
- (NSInteger)numberOfDataSource ;
- (MMFileInfor*)fileInforAtIndex:(NSInteger)index ;
- (void)deleteFileAtIndex:(NSInteger)index compeltion:(void(^)())completion ;

@end
