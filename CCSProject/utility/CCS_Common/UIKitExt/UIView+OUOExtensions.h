//
//  UIView+OUOExtensions.h
//  OUOKit
//
//  Created by 杨福军 on 12-9-4.
//  Copyright (c) 2012年 杨福军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (OUOExtensions)

///////////////////////////////////////////////////////
#pragma mark - 位置、大小

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

// Setting these modifies the origin but not the size.
@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameBottom;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

-(void)verticalCenterInView:(UIView*)aView;
-(void)horizontalCenterInView:(UIView*)aView;
-(void)rightAlignInView:(UIView*)aView margin:(CGFloat)margin;
-(void)bottomAlignInView:(UIView*)aView margin:(CGFloat)margin;

///////////////////////////////////////////////////////
#pragma mark - 层级

-(int)getSubviewIndex;

-(void)bringToFront;
-(void)sentToBack;

-(void)bringOneLevelUp;
-(void)sendOneLevelDown;

-(BOOL)isInFront;
-(BOOL)isAtBack;

-(void)swapDepthsWithView:(UIView*)swapView;

///////////////////////////////////////////////////////
#pragma mark - NIB

+ (id)loadFromNIB;

///////////////////////////////////////////////////////
#pragma mark -

- (void)removeAllSubviews;
@end
