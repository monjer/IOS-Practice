//
//  MMFileCell.m
//  QuickLook
//
//  Created by manjunhan on 14-12-8.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMFileCell.h"

@interface MMFileCell()

@property (weak, nonatomic) IBOutlet UILabel *fileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fileSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fileCreateDateLabel;

- (void)updateCell;

@end
@implementation MMFileCell

- (void)setFileInfor:(MMFileInfor *)fileInfor
{
    _fileInfor = fileInfor ;
    if(_fileInfor){
        [self updateCell];
    }
}

- (void)updateCell
{
    _fileNameLabel.text = _fileInfor.fileName ;
    _fileSizeLabel.text = [_fileInfor sizeString] ;
    _fileCreateDateLabel.text = [_fileInfor dateString];
}

@end
