//
//  ViewController.m
//  TPViewDemo
//
//  Created by d.taraev on 20.10.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "ViewController.h"
#import "TPViewModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) TPViewModel *model;

@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.model = [[TPViewModel alloc] init];
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    
    [self.label addGestureRecognizer:recognizer];
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    self.model.username = self.usernameTextField.text;
    self.model.password = self.passwordTextField.text;
    
    self.label.text = [NSString stringWithFormat:@"%@ %@", self.model.username, self.model.password];
    
}

- (void)tapped:(UIGestureRecognizer *)recognizer {
    NSLog(@"tapped");
//    self.model.username;
    if (self.model.isEmpty) {
        self.usernameTextField.text = self.model.username;
        self.passwordTextField.text = self.model.password;
    } else {
        self.usernameTextField.text = @"";
        self.passwordTextField.text = @"";
    }
    self.model.isEmpty = !self.model.isEmpty;
}

@end
