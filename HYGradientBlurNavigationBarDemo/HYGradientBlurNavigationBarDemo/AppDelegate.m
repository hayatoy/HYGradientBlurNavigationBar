//
//  AppDelegate.m
//  HYGradientBlurNavigationBarDemo
//
//  Created by Hayato Yoshikawa on 09/11/2014.
//  Copyright (c) 2014 Hayato Yoshikawa. All rights reserved.
//

#import "AppDelegate.h"
#import "HYGradientBlurNavigationBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //[[HYGradientBlurNavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f]];
    [[HYGradientBlurNavigationBar appearance] setBarTintColors:[NSArray arrayWithObjects:
                            (id)[UIColor colorWithRed:70.0f/255.0f green:137.0/255.0f blue:102.0f/255.0f alpha:0.65f].CGColor,
                            (id)[UIColor colorWithRed:255.0f/255.0f green:176.0/255.0f blue:59.0f/255.0f alpha:0.65f].CGColor,
                            (id)[UIColor colorWithRed:142.0f/255.0f green:40.0f/255.0f blue:0.0f/255.0f alpha:0.65f].CGColor,nil]];
    [[HYGradientBlurNavigationBar appearance] setBarGradientDirection:LeftToRight];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
