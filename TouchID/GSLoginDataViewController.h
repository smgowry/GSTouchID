//
//  LoginDataViewController.h
//  TouchID
//
//  Created by Gowri Sammandhamoorthy on 5/14/16.
//  Copyright © 2016 Gowri Sammandhamoorthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSLoginDataViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;

- (IBAction)showDataButton:(id)sender;
- (IBAction)exitButton:(id)sender;

@end
