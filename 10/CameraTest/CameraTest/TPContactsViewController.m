//
//  TPContactsViewController.m
//  CameraTest
//
//  Created by d.taraev on 01.12.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "TPContactsViewController.h"
#import <ContactsUI/ContactsUI.h>

@interface TPContactsViewController () <CNContactPickerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *showContactsButton;
@end

@implementation TPContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)showContacts:(UIButton *)sender {
    
    CNContactPickerViewController *contactsVC = [[CNContactPickerViewController alloc] init];
    contactsVC.delegate = self;
    
    [self presentViewController:contactsVC animated:YES completion:nil];
}


#pragma mark - CNContactPickerDelegate

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    
    NSLog(@"selectedContact: %@", contact);
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
