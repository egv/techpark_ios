//
//  TPLMainViewController.m
//  lesson06
//
//  Created by d.taraev on 27.10.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "TPLMainViewController.h"

@interface TPLMainViewController () <NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@end

@implementation TPLMainViewController

NSString * const kFilename = @"Proton_Zvezda_crop.jpg";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)startImageDownload {
    self.progressView.progress = 0.0;
    self.imageView.image = nil;
    
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    NSURL* downloadTaskURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/1/14/Proton_Zvezda_crop.jpg"];
    
    
    /*
    Способ 1 - загрузка и обработка загрузки с помощью реализации методов протокола NSURLSessionDownloadDelegate
    */
    [[session downloadTaskWithURL:downloadTaskURL] resume];
    
    /*
     Способ 2 - загрузка и обработка загрузки с помощью completion блока
     */
    
//    [[session downloadTaskWithURL: downloadTaskURL
//                completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
//                    
//                    NSFileManager *fileManager = [NSFileManager defaultManager];
//                    
//                    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
//                    NSURL *documentsDirectory = [urls objectAtIndex:0];
//                    
//                    NSURL *originalUrl = [NSURL URLWithString:[downloadTaskURL lastPathComponent]];
//                    NSURL *destinationUrl = [documentsDirectory URLByAppendingPathComponent:[originalUrl lastPathComponent]];
//                    NSError *fileManagerError;
//                    
//                    [fileManager removeItemAtURL:destinationUrl error:NULL];
//                    //ключевая  строчка!
//                    [fileManager copyItemAtURL:location toURL:destinationUrl error:&fileManagerError];
//                    
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        self.progressView.progress = 1.0;
//                        NSString *stringPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//                        NSString *fullURLString  = [stringPath stringByAppendingPathComponent:kFilename];
//                        self.imageView.image = [UIImage imageWithContentsOfFile:fullURLString];;
//                        
//                    });
//                }] resume];
    
    [session finishTasksAndInvalidate];
}

- (IBAction)downloadButtonTapped:(UIButton *)sender {
    [self startImageDownload];
}


- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"[didCompleteWithError:]");
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = (float)totalBytesWritten / totalBytesExpectedToWrite;
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    
    NSLog(@"didFinishDownloadingToURL: %@", location);

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = [urls objectAtIndex:0];
    
    NSURL *destinationUrl = [documentsDirectory URLByAppendingPathComponent:kFilename];
    NSError *fileManagerError;
    
    [fileManager removeItemAtURL:destinationUrl error:NULL];
    
    //ключевая  строчка!
    [fileManager copyItemAtURL:location toURL:destinationUrl error:&fileManagerError];
    
    NSString *stringPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *fullURLString  = [stringPath stringByAppendingPathComponent:kFilename];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = 1.0;
        self.imageView.image = [UIImage imageWithContentsOfFile:fullURLString];
    });
}

@end
