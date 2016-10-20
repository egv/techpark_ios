//
//  TPViewModel.m
//  TPViewDemo
//
//  Created by d.taraev on 20.10.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "TPViewModel.h"

@implementation TPViewModel

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    if (self = [super init]) {
        _username = username;
        _password = password;
        _isEmpty = NO;
        
    }
    return self;
}

-(instancetype)init {
    return [self initWithUsername:@"" password:@""];
}

@end
