//
//  HYGradientBlurNavigationBar.m
//
//  Created by Hayato Yoshikawa on 09/11/2014.
//  Copyright (c) 2014 Hayato Yoshikawa. All rights reserved.
//

#import "HYGradientBlurNavigationBar.h"
#import <QuartzCore/QuartzCore.h>

@interface HYGradientBlurNavigationBar()
@property (nonatomic, strong) CAGradientLayer *axialGradientLayer;
@property (nonatomic, strong) HYGradientLayer *radialGradientLayer;
@end

@interface HYGradientLayer()
@property (nonatomic) CGPoint gradCenter;
@property (nonatomic) NSArray *gradientColors;

@end

@implementation HYGradientLayer : CALayer
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setNeedsDisplay];
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    NSLog(@"draw");
    if (self.gradientColors.count>0){
        size_t gradLocationsNum = self.gradientColors.count;
        CGFloat *gradColors = malloc(sizeof(CGFloat) * self.gradientColors.count);
        
        for (int i=0; i<self.gradientColors.count; i++){
            const CGFloat *c = CGColorGetComponents((CGColorRef)[self.gradientColors objectAtIndex:i]);
            gradColors[i*4] = c[0];
            gradColors[i*4+1] = c[1];
            gradColors[i*4+2] = c[2];
            gradColors[i*4+3] = c[3];
        }
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, gradColors, nil, gradLocationsNum);
        CGColorSpaceRelease(colorSpace);
        
        CGPoint center= CGPointMake(self.bounds.size.width*self.gradCenter.x, self.bounds.size.height*self.gradCenter.y);
        float radius = MAX(self.bounds.size.width*(ABS(self.gradCenter.x-0.5)+0.5),
                           self.bounds.size.height*(ABS(self.gradCenter.y-0.5)+0.5)) ;
        
        CGContextDrawRadialGradient (ctx, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
        
        
        CGGradientRelease(gradient);
        free(gradColors);
    }
}

@end

@implementation HYGradientBlurNavigationBar

- (void)setBarTintColors:(NSArray *)barTintColors
{
    if (!self.axialGradientLayer)  self.axialGradientLayer = [CAGradientLayer layer];
    if (!self.radialGradientLayer) self.radialGradientLayer = [HYGradientLayer layer];
    self.axialGradientLayer.colors = barTintColors;
    self.radialGradientLayer.gradientColors = barTintColors;
}

- (void)setBarGradientDirection:(GradientDirection)direction
{
    if (!self.axialGradientLayer)  self.axialGradientLayer = [CAGradientLayer layer];
    if (!self.radialGradientLayer) self.radialGradientLayer = [HYGradientLayer layer];
    
    CGPoint startPoint, endPoint;
    if (direction == TopToBottom){
        startPoint = CGPointMake(0.5, 0.0);
        endPoint   = CGPointMake(0.5, 1.0);
    }else if (direction == BottomToTop){
        startPoint = CGPointMake(0.5, 1.0);
        endPoint   = CGPointMake(0.5, 0.0);
    }else if (direction == LeftToRight){
        startPoint = CGPointMake(0.0, 0.5);
        endPoint   = CGPointMake(1.0, 0.5);
    }else if (direction == RightToLeft){
        startPoint = CGPointMake(1.0, 0.5);
        endPoint   = CGPointMake(0.0, 0.5);
    }else if (direction == LeftTopToRightBottom){
        startPoint = CGPointMake(0.0, 0.0);
        endPoint   = CGPointMake(1.0, 1.0);
    }else if (direction == LeftBottomToRightTop){
        startPoint = CGPointMake(1.0, 1.0);
        endPoint   = CGPointMake(0.0, 0.0);
    }else if (direction == RightTopToLeftBottom){
        startPoint = CGPointMake(1.0, 0.0);
        endPoint   = CGPointMake(0.0, 1.0);
    }else if (direction == RightBottomToLeftTop){
        startPoint = CGPointMake(1.0, 1.0);
        endPoint   = CGPointMake(0.0, 0.0);
    }else{ //Default TopToBottom
        startPoint = CGPointMake(0.5, 0.0);
        endPoint   = CGPointMake(0.5, 1.0);
    }
    
    self.axialGradientLayer.startPoint = startPoint;
    self.axialGradientLayer.endPoint   = endPoint;
    
    self.radialGradientLayer.gradCenter = startPoint;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

    if (self.gradientType == Radial){
        if (!!self.radialGradientLayer){
            self.radialGradientLayer.frame = CGRectMake(0, 0 - statusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + statusBarHeight);
            [self.layer insertSublayer:self.radialGradientLayer atIndex:1];
        }
    }else { //Default
        if (!!self.axialGradientLayer){
            self.axialGradientLayer.frame = CGRectMake(0, 0 - statusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + statusBarHeight);
            [self.layer insertSublayer:self.axialGradientLayer atIndex:1];
        }
    }
}

@end
