//
//  TPLSession.m
//  lesson06
//
//  Created by d.taraev on 27.10.16.
//  Copyright © 2016 mail.ru. All rights reserved.
//

#import "TPLSession.h"

@implementation TPLSession

+ (instancetype)sharedSession {
    static TPLSession *sharedTPLSession = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTPLSession = [[self alloc] init];
    });
    return sharedTPLSession;
}

- (id)init {
    if (self = [super init]) {
        _currentUser = [[TPLUser alloc] init];
    }
    return self;
}


@end
