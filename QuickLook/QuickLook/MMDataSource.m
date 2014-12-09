//
//  MMDataSource.m
//  QuickLook
//
//  Created by manjunhan on 14-12-8.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMDataSource.h"
#import "AppDelegate.h"

static dispatch_queue_t FileOperationQueue;

@interface MMDataSource()

- (NSString*)filePathOfQuicklook ;
- (void)runFileOperation:(void(^)())operation completion:(void(^)())completion ;
- (void)addFileInforToDataSource:(NSString*)filePath fileAttr:(NSDictionary*)fileAttr ;

@end

@implementation MMDataSource

- (instancetype)initWithCellReuseID:(NSString*)reuseID configuration:(MMFileCellConfiguration)configuration
{
    self = [super init];
    if(self){
        _cellReuseId = reuseID;
        _configuration = configuration ;
    }
    return self ;
}

- (void)loadData:(void(^)())completion
{
    [self runFileOperation:^{
        
        NSString *quicklookPath = [self filePathOfQuicklook];
        if (!_fileInfos) {
            _fileInfos = [NSMutableArray new];
        }
        NSError *error;
        NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:quicklookPath error:&error];
        
        [files enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSString *fileOrFolderName = obj;
            NSString *filePath =  [quicklookPath stringByAppendingPathComponent:fileOrFolderName];
            NSError *fileError;
            NSDictionary *fileAttr = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&fileError];
            NSString *fileType = [fileAttr fileType];
            if(!fileError && [NSFileTypeRegular compare:fileType] == NSOrderedSame){
                [self addFileInforToDataSource:filePath fileAttr:fileAttr];
            }
        }];
        
    } completion:^{
        if(completion){
            completion();
        }
    }];

    
}

- (MMFileInfor*)getFileInforOfIndex:(NSUInteger)index
{
    if(index >= self.fileInfos.count){
        return nil;
    }
    return [self.fileInfos objectAtIndex:index];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _fileInfos.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:self.cellReuseId];
    if(!cell){
        cell = [[MMFileCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellReuseId];
    }
    MMFileInfor *dataItem = [_fileInfos objectAtIndex:indexPath.row];
    self.configuration(cell , dataItem , indexPath);
    return cell ;
}

- (void)savePDFFile:(NSString*)pdfFilePath completion:(void(^)())completion
{
    [self runFileOperation:^{
        NSData *fileData = [NSData dataWithContentsOfFile:pdfFilePath];
        NSString *quicklookPath = [self filePathOfQuicklook];
        NSString *fileName = [pdfFilePath lastPathComponent];
        NSString *filePath = [quicklookPath stringByAppendingPathComponent:fileName];
        [fileData writeToFile:filePath atomically:YES];
        NSError *error;
        NSDictionary *fileAttr = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
        [self addFileInforToDataSource:filePath fileAttr:fileAttr];
    } completion:^{
        if(completion){
            completion();
        }
    }];
}

- (NSString*)filePathOfQuicklook
{
    NSString *appHomeDir = NSHomeDirectory() ;
    NSString *documentsDir = [appHomeDir stringByAppendingPathComponent:@"Documents"];
    NSString *savePath = [documentsDir stringByAppendingPathComponent:@"quicklook/"];
    if(![[NSFileManager defaultManager] fileExistsAtPath:savePath]){
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:savePath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    return savePath;
}

- (void)runFileOperation:(void(^)())operation completion:(void(^)())completion
{
    if (!FileOperationQueue) {
        FileOperationQueue = dispatch_queue_create("com.file.operation.queue", DISPATCH_QUEUE_PRIORITY_DEFAULT);
    }
    dispatch_async(FileOperationQueue, ^{
        operation();
        dispatch_async(dispatch_get_main_queue(), ^{
            if(completion){
                completion();
            }
        });
    });

}

- (void)addFileInforToDataSource:(NSString*)filePath fileAttr:(NSDictionary*)fileAttr
{
    MMFileInfor *fileInfor = [[MMFileInfor alloc]init];
    fileInfor.fileName = [filePath lastPathComponent];
    fileInfor.createDate = [fileAttr fileCreationDate];
    fileInfor.fileSize = [NSNumber numberWithLongLong: [fileAttr fileSize]];
    fileInfor.path = filePath ;
    [_fileInfos addObject:fileInfor];

}

- (NSInteger)numberOfDataSource
{
    return _fileInfos == nil ? 0 : _fileInfos.count;
}

- (MMFileInfor*)fileInforAtIndex:(NSInteger)index
{
    if(!_fileInfos || _fileInfos.count <= index || _fileInfos.count <=0){
        return nil ;
    }
    return _fileInfos[index];
}

- (void)deleteFileAtIndex:(NSInteger)index compeltion:(void(^)())completion
{
    [self runFileOperation:^{
        MMFileInfor *fileInfor =  _fileInfos[index];
        NSURL *fileURL = fileInfor.pathURL;
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtURL:fileURL error:&error];;
        [_fileInfos removeObjectAtIndex:index];
    } completion:^{
        if (completion) {
            completion();
        }
    }];
}

@end
