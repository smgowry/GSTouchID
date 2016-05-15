//
//  LoginDataViewController.m
//  TouchID
//
//  Created by Gowri Sammandhamoorthy on 5/14/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//

#import "GSLoginDataViewController.h"

@interface GSLoginDataViewController ()

@end

@implementation GSLoginDataViewController

@synthesize userNameLabel, passwordLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Login Data", nil);
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.toolbar.hidden = NO;
    userNameLabel.text = @"";
    passwordLabel.text = @"";
    
    
}


- (IBAction)showDataButton:(id)sender {
    userNameLabel.text = [NSString stringWithFormat:@"User Name: %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"UserName"]];
    passwordLabel.text = [NSString stringWithFormat:@"Password: %@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Password"]];
}

- (IBAction)exitButton:(id)sender {
    exit(0);
}


@end
