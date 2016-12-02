//
//  TPMailViewController.m
//  CameraTest
//
//  Created by d.taraev on 01.12.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "TPMailViewController.h"
#import <MessageUI/MessageUI.h>

@interface TPMailViewController () <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *sendEmailButton;
@end

@implementation TPMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sendEmailButton.enabled = [self canSendMail];
}

- (BOOL)canSendMail {
    if ([MFMailComposeViewController canSendMail]) {
        
        return YES;
    } else {
        
        return NO;
    }
}

- (IBAction)sendEmail {
    
    MFMailComposeViewController* composeVC = [[MFMailComposeViewController alloc] init];
    composeVC.mailComposeDelegate = self;
    
    // Configure the fields of the interface.
    composeVC.toRecipients = @[@"address@example.com"];
    composeVC.subject = @"Hello!";
    [composeVC setMessageBody:@"Hello from California!" isHTML:NO];
    
    // Present the view controller modally.
    [self presentViewController:composeVC animated:YES completion:nil];
}



#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    // Check the result or perform other tasks.
    
    // Dismiss the mail compose view controller.
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
