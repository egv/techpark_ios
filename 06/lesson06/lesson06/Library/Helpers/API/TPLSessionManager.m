//
//  TPLSessionManager.m
//  lesson06
//
//  Created by d.taraev on 28.10.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "TPLSessionManager.h"

@implementation TPLSessionManager

NSString * const kApiHost = @"your api host";

+ (instancetype)sharedManager {
    static TPLSessionManager *sharedTPLSessionManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        sharedTPLSessionManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:kApiHost] sessionConfiguration:configuration];
    });
    
    return sharedTPLSessionManager;
}

- (BOOL)call:(NSString *)path
       token:(NSString *)token
  httpMethod:(TPLHTTPMethod)httpMethod
     timeout:(NSTimeInterval)timeout
  parameters:(NSDictionary *)params
     success:(void (^)(NSURLSessionDataTask *, id))success
     failure:(void (^)(NSURLSessionDataTask *, NSError *))failure progress:(void (^)(NSUInteger, long long, long long))progress {
    
    NSURLSessionDataTask *dataTask = nil;
    
    switch (httpMethod) {
        case TPLHTTPMethodGET: {
            dataTask = [self GET:@"" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(task, error);
            }];
            break;
        }
        case TPLHTTPMethodPOST: {
            dataTask = [self POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(task, error);
            }];
            break;
        }
        case TPLHTTPMethodMultipart: {
            dataTask = [self POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(task, responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure(task, error);
            }];
            break;
        }
            
        default:
            break;
    }
    return YES;
}

@end
