//
//  HYGradientBlurNavigationBar.m
//
//  Created by Hayato Yoshikawa on 09/11/2014.
//  Copyright (c) 2014 Hayato Yoshikawa. All rights reserved.
//

#import "HYGradientBlurNavigationBar.h"
#import <QuartzCore/QuartzCore.h>

@interface HYGradientBlurNavigationBar()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation HYGradientBlurNavigationBar

- (void)setBarTintColors:(NSArray *)barTintColors
{
    if (!self.gradientLayer){
        self.gradientLayer = [CAGradientLayer layer];
    }
    self.gradientLayer.colors = barTintColors;
}

- (void)setBarGradientDirection:(GradientDirection)direction
{
    if (!self.gradientLayer){
        self.gradientLayer = [CAGradientLayer layer];
    }
    
    CGPoint startPoint, endPoint;
    if (direction == TopToBottom){
        startPoint = CGPointMake(0.5, 0.0);
        endPoint   = CGPointMake(0.5, 1.0);
    }else if (direction == LeftToRight){
        startPoint = CGPointMake(0.0, 0.5);
        endPoint   = CGPointMake(1.0, 0.5);
    }else if (direction == LeftTopToRightBottom){
        startPoint = CGPointMake(0.0, 0.0);
        endPoint   = CGPointMake(1.0, 1.0);
    }else if (direction == RightTopToLeftBottom){
        startPoint = CGPointMake(1.0, 0.0);
        endPoint   = CGPointMake(0.0, 1.0);
    }else{
        startPoint = CGPointMake(0.5, 0.0);
        endPoint   = CGPointMake(0.5, 1.0);
    }
    
    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint   = endPoint;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!!self.gradientLayer){
        CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        self.gradientLayer.frame = CGRectMake(0, 0 - statusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + statusBarHeight);
        [self.layer insertSublayer:self.gradientLayer atIndex:1];
    }
}

@end
