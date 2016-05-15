//
//  AppDelegate.m
//  TouchID
//
//  Created by Gowri Sammandhamoorthy on 5/13/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//

#import "AppDelegate.h"
#import "GSLoginDataViewController.h"
#import "GSNavigationCotroller.h"

#import <LocalAuthentication/LocalAuthentication.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ( [[NSUserDefaults standardUserDefaults]valueForKey:@"TouchIDEntrolled"]) {
        [self evaluatePolicy];
    }

    return YES;
}

-(void)evaluatePolicy {
    LAContext *context = [[LAContext alloc] init];
    __block  NSString *message;
    
    // Show the authentication UI with our reason string.
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Unlock access to locked feature" reply:^(BOOL success, NSError *authenticationError) {
        if (success) {
            UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            GSNavigationCotroller* presentController = [storyBoard instantiateViewControllerWithIdentifier:@"ToNavigationView"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.window.rootViewController presentViewController:presentController animated:YES completion:nil];
            });
            
        }
        else {
            message = [NSString stringWithFormat:@"evaluatePolicy: %@", authenticationError.localizedDescription];
            NSLog(@"no");
        }
        
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
 
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
