//
//  HYGradientBlurNavigationBar.h
//
//  Created by Hayato Yoshikawa on 09/11/2014.
//  Copyright (c) 2014 Hayato Yoshikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GradientDirection) {
    TopToBottom,
    LeftToRight,
    LeftTopToRightBottom,
    RightTopToLeftBottom
};

@interface HYGradientBlurNavigationBar : UINavigationBar
- (void)setBarTintColors:(NSArray *)barTintColors;
- (void)setBarGradientDirection:(GradientDirection)direction;
@end

