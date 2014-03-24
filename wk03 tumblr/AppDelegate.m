//
//  AppDelegate.m
//  wk03 tumblr
//
//  Created by Jorge Angarita on 3/20/14.
//  Copyright (c) 2014 jorge. All rights reserved.
//

#import "AppDelegate.h"
#import "homeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIViewController * vc = [[homeViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    nvc.navigationBar.barTintColor = [UIColor colorWithRed:(51/255.0) green:(66/255.0) blue:(86/255.0) alpha:1];
    nvc.navigationBar.translucent = NO;
    nvc.navigationBar.tintColor = [UIColor whiteColor];
    
    //[[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:(0/255.0) green:(50/255.0) blue:(0/255.0) alpha:0.7], NSForegroundColorAttributeName, [UIFont fontWithName:@"HelveticaNeue-Medium" size:17], NSFontAttributeName, nil]];

    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.6]];
    

    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
    
    //self.window.backgroundColor = [UIColor colorWithRed:(50/255.0) green:(50/255.0) blue:(150/255.0) alpha:1];
    //[application setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
