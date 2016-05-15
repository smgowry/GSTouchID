//
//  ViewController.m
//  TouchID
//
//  Created by Gowri Sammandhamoorthy on 5/13/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//

#import "GSTouchIDViewController.h"
#import "GSNavigationCotroller.h"

@interface GSTouchIDViewController ()

@end

@implementation GSTouchIDViewController

@synthesize touchIDSwitch, userNameTextField, passwordTedtField;

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


-(void)viewWillAppear:(BOOL)animated{
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"TouchIDEntrolled"]) {
        touchIDSwitch.on = YES;
    }
}

- (IBAction)touchIDSwitch:(id)sender {
    if (touchIDSwitch.on) {
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"TouchIDEntrolled"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    else{
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"TouchIDEntrolled"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

- (IBAction)loginButtonPressed:(id)sender {
    if ([userNameTextField.text isEqualToString:[[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"]] && [passwordTedtField.text isEqualToString:[[NSUserDefaults standardUserDefaults]valueForKey:@"Password"]]) {
        
        UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        GSNavigationCotroller* presentController = [storyBoard instantiateViewControllerWithIdentifier:@"ToNavigationView"];
        [self presentViewController:presentController animated:YES completion:nil];
    }
}

- (IBAction)signUpButtonPressed:(id)sender {
    if ( ![[NSUserDefaults standardUserDefaults]valueForKey:@"AccountCreated"]) {
        if (userNameTextField.text.length != 0 && passwordTedtField.text.length != 0) {
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"AccountCreated"];
            [[NSUserDefaults standardUserDefaults]setValue:userNameTextField.text forKey:@"UserName"];
            [[NSUserDefaults standardUserDefaults]setValue:passwordTedtField.text forKey:@"Password"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            GSNavigationCotroller* presentController = [storyBoard instantiateViewControllerWithIdentifier:@"ToNavigationView"];
            [self presentViewController:presentController animated:YES completion:nil];
        }
    }
    else{
        [self alertWithTitle:@"TouchID" andMessage:@"You already created an account, Please enter your user name and password"];
        userNameTextField.text = @"";
        passwordTedtField.text = @"";
    }
}

-(void)alertWithTitle:(NSString*)title andMessage:(NSString*)message{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* OK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        NSLog(@"OK Button Pressed");
    }];
    
    [alert addAction:OK];
    [self presentViewController:alert animated:YES completion:nil];
}








@end
