//
//  TPLSessionManager.h
//  lesson06
//
//  Created by d.taraev on 28.10.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, TPLHTTPMethod) {
    TPLHTTPMethodGET,
    TPLHTTPMethodPOST,
    TPLHTTPMethodMultipart
};

@interface TPLSessionManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (BOOL)call:(NSString *)path
       token:(NSString *)token
  httpMethod:(TPLHTTPMethod)httpMethod
     timeout:(NSTimeInterval)timeout
  parameters:(NSDictionary *)params
     success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
    progress:(void (^)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite))progress;

@end
