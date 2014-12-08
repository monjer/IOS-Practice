//
//  UIView+Dimensions.h
//  MolaMolaPro
//
//  Created by manjun.han on 12-11-21.
//  Copyright (c) 2012年 com.molamola. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    Purpose 
        为Cocoa touch中的UIView添加快速访问对象尺寸定位属性的分类
 **/
@interface UIView (Dimensions)

@property (nonatomic) CGFloat x ;

@property (nonatomic) CGFloat y ;

@property (nonatomic) CGFloat width ;

@property (nonatomic) CGFloat height ;

@property (nonatomic) CGSize size ;

@property (nonatomic) CGPoint origin ;

// center
@property (nonatomic) CGFloat centerX ;

@property (nonatomic) CGFloat centerY ;


// frame
@property (nonatomic) CGFloat minX ;

@property (nonatomic) CGFloat minY ;

@property (nonatomic) CGFloat midX ;

@property (nonatomic) CGFloat midY ;

@property (nonatomic) CGFloat maxX ;

@property (nonatomic) CGFloat maxY ;


// bounds
@property (nonatomic) CGFloat localMinX ;

@property (nonatomic) CGFloat localMinY ;

@property (nonatomic) CGFloat localMidX ;

@property (nonatomic) CGFloat localMidY ;

@property (nonatomic) CGFloat localMaxX ;

@property (nonatomic) CGFloat localMaxY ;

// local center
@property (nonatomic) CGFloat localCenterX ;

@property (nonatomic) CGFloat localCenterY ;

@property (nonatomic) CGPoint localCenter ;


// corner pt

@property (readonly, nonatomic) CGPoint leftTopCornerPt ;

@property (readonly, nonatomic) CGPoint rightTopCornerPt ;

@property (readonly, nonatomic) CGPoint leftBottomCornerPt ;

@property (readonly, nonatomic) CGPoint rightBottomCornerPt ;


@end
