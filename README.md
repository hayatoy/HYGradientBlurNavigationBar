HYGradientBlurNavigationBar
===========================

HYGradientBlurNavigationBar is a custom navigation bar with gradient background.

Axial Gradient:
  * ![Sample](https://raw.githubusercontent.com/hayatoy/HYGradientBlurNavigationBar/master/Images/sample5.png) Opacity:1.0
  * ![Sample](https://raw.githubusercontent.com/hayatoy/HYGradientBlurNavigationBar/master/Images/sample6.png) Opacity:0.8

Radial Gradient:
  * ![Sample](https://raw.githubusercontent.com/hayatoy/HYGradientBlurNavigationBar/master/Images/sample7.png)
  * ![Sample](https://raw.githubusercontent.com/hayatoy/HYGradientBlurNavigationBar/master/Images/sample8.png)

Other samples:

![Sample](https://raw.githubusercontent.com/hayatoy/HYGradientBlurNavigationBar/master/Images/sample1.png)
![Sample](https://raw.githubusercontent.com/hayatoy/HYGradientBlurNavigationBar/master/Images/sample2.png)
![Sample](https://raw.githubusercontent.com/hayatoy/HYGradientBlurNavigationBar/master/Images/sample3.png)
![Sample](https://raw.githubusercontent.com/hayatoy/HYGradientBlurNavigationBar/master/Images/sample4.png)

Usage
-----

  1. Copy `HYGradientBlurNavigationBar.h` and `HYGradientBlurNavigationBar.m` to your project.
  2. Import the header file where you need, or Set the Class in Inspector.
```objc
#import "HYGradientBlurNavigationBar.h"
```
  3. Set gradient colors, direction and method.
```objc
[[HYGradientBlurNavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
[[HYGradientBlurNavigationBar appearance] setBarTintColors:[NSArray arrayWithObjects:
  (id)[UIColor colorWithRed:243.0f/255.0f green:242.0f/255.0f blue:182.0f/255.0f alpha:0.9f].CGColor,
  (id)[UIColor colorWithRed:76.0f/255.0f green:152.0f/255.0f blue:175.0f/255.0f alpha:0.9f].CGColor,nil]];
[[HYGradientBlurNavigationBar appearance] setGradientType:Radial];
[[HYGradientBlurNavigationBar appearance] setBarGradientDirection:RightBottomToLeftTop];
```

**Make status bar color white**
  1. Set `View controller-based status bar appearance` to **NO** in `Info.plist`
  2. Add `[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];` to `- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions` in `AppDelegate.m`

Requirements
------------

iOS 7.0 or higher

License
-------

This whole project is released under the terms of the MIT license.
