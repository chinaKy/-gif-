//
//  AppDelegate.m
//  启动gif图片
//
//  Created by ky on 15/6/12.
//  Copyright (c) 2015年 ky. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIImage+GIF.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController=[[ViewController alloc] init];
    self.window=window;
    [window makeKeyAndVisible];

    UIImageView *imageView=[[UIImageView alloc]init];
    imageView.image=[UIImage sd_animatedGIFNamed:@"test"];
    imageView.frame=[UIScreen mainScreen].bounds;
    imageView.layer.masksToBounds=YES;
    imageView.backgroundColor=[UIColor blackColor];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    [[UIApplication sharedApplication].keyWindow addSubview:imageView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //隐藏
         [UIView animateWithDuration:0.35 animations:^{
             
             imageView.transform=CGAffineTransformMakeScale(2, 2);
             imageView.alpha=0.2;
         } completion:^(BOOL finished) {
              [imageView removeFromSuperview];
         }];
        
    });

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"%@",[url host]);
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
