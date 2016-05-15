//
//  ViewController.h
//  TouchID
//
//  Created by Gowri Sammandhamoorthy on 5/13/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSTouchIDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTedtField;
@property (weak, nonatomic) IBOutlet UISwitch *touchIDSwitch;

- (IBAction)touchIDSwitch:(id)sender;
- (IBAction)loginButtonPressed:(id)sender;
- (IBAction)signUpButtonPressed:(id)sender;

@end

