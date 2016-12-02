//
//  TPImagePickerViewController.m
//  CameraTest
//
//  Created by d.taraev on 01.12.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "TPImagePickerViewController.h"

@interface TPImagePickerViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation TPImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showCamera:(UIButton *)sender {
    
    [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
}
- (IBAction)showPhotos:(UIButton *)sender {
    
    [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = sourceType;
    
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}



#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSLog(@"info: %@", info);
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
