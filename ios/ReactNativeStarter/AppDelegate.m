/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
@import NativeNavigation;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self
                                            launchOptions:launchOptions];
  ReactNavigationCoordinator *coordinator = [ReactNavigationCoordinator sharedInstance];

  [coordinator setBridge:bridge];
  [coordinator setDelegate:self];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  ReactViewController *mainViewController = [[ReactViewController alloc] initWithModuleName:@"ScreenOne"];
  self.window.rootViewController = [[coordinator navigation] makeNavigationControllerWithRootViewController:mainViewController];
  [self.window makeKeyAndVisible];
  return YES;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
}

- (UIViewController *)rootViewControllerForCoordinator: (ReactNavigationCoordinator *)coordinator {
  return self.window.rootViewController;
}

@end
