//
//  YHAppDelegate.m
//  LaunchImage
//
//  Created by Jiang on 14-6-2.
//  Copyright (c) 2014年 Johnny. All rights reserved.
//

#import "YHAppDelegate.h"
#import "HomeVC.h"

@implementation YHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    UIImageView *bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ads_bg"]];
    [bgImage setFrame:CGRectMake(0, 0, 320, 568)];
    [bgView addSubview:bgImage];
    
    
    /**
     *  这里可以加载从网络获取的图片，如果加载成功，再执行下面延迟三秒的操作，否则，跳过延迟三秒
     */
    UIImageView *adImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ads"]];
                            [adImage setFrame:CGRectMake(0, 0, 320, 460)];
    [bgImage addSubview:adImage];

    _viewController = [[HomeVC alloc] init];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [bgView setHidden:YES];
        [self.window setRootViewController:_viewController];
    });
    [self.window addSubview:bgView];
    

    [self.window makeKeyAndVisible];
    
    
    return YES;
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
